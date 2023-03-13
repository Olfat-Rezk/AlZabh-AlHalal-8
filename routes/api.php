<?php

use App\Http\Controllers\Admin\AuthinticationController as AdminAuth;
use App\Http\Controllers\User\AuthinticationController as UserAuth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\loginController;
use App\Http\Controllers\Api\BranchController;
use App\Http\Controllers\Api\AccountController;
use App\Http\Controllers\Api\CategoryContoller;
use App\Http\Controllers\Api\PackingController;
use App\Http\Controllers\Api\ShredderController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::prefix('category')->group(function(){
    Route::get('/' , [CategoryContoller::class ,'index']);
    Route::post('/store' , [CategoryContoller::class ,'store']);
    Route::get('/{id}' , [CategoryContoller::class ,'show']);
    Route::put('/update/{id}' , [CategoryContoller::class ,'update']);
    Route::delete('/delete/{id}' , [CategoryContoller::class ,'destroy']);

});



//Route::apiResource('/category','categoryContoller');
//Route::post('/category/store',[categoryContoller::class,'store']);
Route::post('login',[loginController::class,'login']);
Route::post('register',[loginController::class,'register']);
Route::post('logout',[loginController::class,'logout']);
//Route::apiResource('/altaqte3','Altaqte3Controller');

Route::prefix('shredder')->group(function(){
    Route::get('/',[ShredderController::class,'index']);
    Route::get('/{id}',[ShredderController::class,'show']);
    Route::post('/update/{id}',[ShredderController::class,'update']);
    Route::post('/store',[ShredderController::class,'store']);
    Route::delete('/delete/{id}',[ShredderController::class,'destroy']);

});

Route::prefix('packing')->group(function(){
    Route::get('/',[PackingController::class,'index']);
    Route::post('/store',[PackingController::class,'store']);
    Route::get('/{id}',[PackingController::class,'show']);
    Route::post('update/{id}',[PackingController::class,'update']);
    Route::delete('delete/{id}',[PackingController::class,'destroy']);


});

Route::prefix('account')->group(function(){
    Route::get('/',[AccountController::class,'index']);
    Route::post('/store',[AccountController::class,'store']);
    Route::get('/{id}',[AccountController::class,'show']);
    Route::post('update/{id}',[AccountController::class,'update']);

    Route::delete('delete/{id}',[AccountController::class,'destroy']);


});


Route::prefix('branch')->group(function(){
    Route::get('/',[BranchController::class,'index']);
    Route::post('/store',[BranchController::class,'store']);
    Route::get('/{id}',[BranchController::class,'show']);
    Route::post('update/{id}',[BranchController::class,'update']);

    Route::delete('delete/{id}',[BranchController::class,'destroy']);


});

Route::post('register',[AdminAuth::class,'register']);

Route::middleware('auth::admin-api')->group(function(){
    Route::post('login',[AdminAuth::class,'login']);

    Route::post('logout',[AdminAuth::class,'logout']);

});

Route::middleware('auth::user-api')->group(function(){
    Route::post('login',[UserAuth::class,'login']);

    Route::post('logout',[UserAuth::class,'logout']);

});
