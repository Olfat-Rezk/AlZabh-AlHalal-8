<?php

namespace App\Http\Controllers\Api\User;

use App\Models\User;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthinticationController extends Controller
{
    use GeneralTrait;
    public function register(Request $request){
        $rules=[

                'phone'=>'required|string',
                'name'=>'required|string',
                'email'=>'required|string|email|unique:users|max:200',
                'password'=>'required|string|min:6',
                'city'=>'sometimes|string|exists:users',
                'district'=>'sometimes|string'

            ];
            $validated = Validator::make($request->all(),$rules);
            if($validated->fails()){
                return response()->json($validated->errors()
                    );
            }
            // $input = $request->all();
        //     $input['password']= Hash::make($input['password']);

        // $user =User::create($input);

            $user =User::create($request->all());
            $user->password = Hash::make($request->password) ;
            $user->save();
        // $token = $user->createToken('passport_token')->accessToken;
        return response()->json([
            'user' => $user ,

        ]);
    }

    public function login(Request $request)
    {

        try {
            $rules = [
                "email" => "required|string",
                "password" => "required|string"

            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                $code = $this->returnCodeAccordingToInput($validator);
                return $this->returnValidationError($code, $validator);
            }

            //login

        //    if(Auth::attempt(['email'=>$request->email,'password'=>$request->password])){
            // $user = Auth::user();
        //     // $token =   $user->createToken('passport_token')->accessToken;
        // }
            $user = User::where('email' , $request->email)->first();
            if($user  )
            {
                dd(Hash::check( $user->password , $request->password));
                if(Hash::check($user->password , $request->password))
                {
                    return "lol";

                }
            }
            //return token
            return response()->json([
                'user' => $user ,
                // 'token'=>$token
            ]);

        } catch (\Exception $ex) {
            return $this->returnError($ex->getCode(), $ex->getMessage());
        }


    }

    public function logout(Request $request)
    {
         $token = $request -> header('auth-token');
        if($token){


            $request->user()->currentAccessToken()->delete();; //logout


            return $this->returnSuccessMessage('Logged out successfully');
        }else{
            $this -> returnError('','some thing went wrongs');
        }

    }


}
