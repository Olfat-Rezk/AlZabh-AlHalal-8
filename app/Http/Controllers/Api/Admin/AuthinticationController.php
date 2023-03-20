<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthinticationController extends Controller
{
    use GeneralTrait;
    public function register(Request $request){
        $rules =[

                'name'=>'required|string',
                'phone'=>'required|string',


            ];
            $validated = Validator::make($request->all(),$rules);
            if($validated->fails()){
                return response()->json($validated->errors()
                    );
            }


        $admin =Admin::create($request->all());

        return response()->json([
            'admin' => $admin ,
            // 'token'=>$token
        ]);

    }

    public function login(Request $request)
    {

        try {
            $rules = [

                "phone" => "required"

            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                $code = $this->returnCodeAccordingToInput($validator);
                return $this->returnValidationError($code, $validator);
            }

            //login

            $credentials = $request->only(['phone']);

            $token = Auth::guard('admin')->attempt($credentials);

            if (!$token)
                return $this->returnError('E001', 'بيانات الدخول غير صحيحة');

            $admin = Auth::guard('admin')->user();
            $token = $admin->createToken('passport_token')->accessToken;
            //return token
            return $this->returnData('admin', $admin);

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
