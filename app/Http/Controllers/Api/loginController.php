<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Validator;

class loginController extends Controller

{
    public function __construct(){
        $this->middleware('auth:sanctum',['except'=>['login','register']]);



    }
    public function login(Request $request){

        $rules = [
                'phone'=>'required|string',
            ];

        $validated =Validator()->make($request->all(),$rules);

        if($validated->fails()){
            return response()->json($validated->errors,422) ;
        }

        $user = User::where('phone',$request->phone)->first();
        if($user){
            //$device = $request->input('device',$request->userAgent());
            //$token =$user->createNewToken();
        $user['token'] = $user->createToken('sanctum_token')->accessToken ;
        return response()->json([
            'data'=>$user
        ],200);

        }else{
            return response()->json([
                'error'=>'unauthorized'
            ],401);
        }
    }
        public function register(Request $request){
            $validated =$request->validate([

                    'phone'=>'required|string',
                    'email'=>'required|string|email|unique:users|max:200',
                    'password'=>'required|strin|min:6',
                    'city'=>'required|string|exist:users',
                    'district'=>'required|string'

                ]);
                if($validated->fails()){
                    return response()->json($validated->errors()
                        );
                }

            $user =User::create($request->all());
            $user->createToken();
            return response()->json([
                'user' => $user ,
                'token'=>$token
            ]);




        }

        public function createNewToken($token)
        {
        return response()->json([
            'access_token'=>$token,
            'type'=>'bearer',
            'expiration'=>auth()->factory()->getttl()*24,
            'user'=>auth()->user()
        ]);
        }

        public function logout(Request $request){

            auth()->logout();
            return response()->json([
                'message'=>'user successfully signed out'
            ]);


        }


}
