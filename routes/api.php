<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\loginController;
use App\Http\Controllers\Api\OfferController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\BranchController;
use App\Http\Controllers\Api\AccountController;
use App\Http\Controllers\Api\CategoryContoller;
use App\Http\Controllers\Api\PackingController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ShredderController;
use App\Http\Controllers\Api\Admin\AuthinticationController;


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

Route::post('admin/register',[AuthinticationController::class,'register'])->name('admin/register');
Route::post('admin/login',[AuthinticationController::class,'login']);
Route::middleware('auth:admin')->group(function(){
    Route::post('admin/logout',[AuthinticationController::class,'logout']);
});


Route::prefix('products')->group(function(){
    Route::post('/{category_id}',[ProductController::class,'index']);//show all
    Route::post('/{id}',[ProductController::class,'show']);
    Route::post('/store',[ProductController::class,'store']);
    Route::post('/update/{id}',[ProductController::class,'update']);
    Route::post('/delete/{id}',[ProductController::class,'destroy']);
});


Route::prefix('offers')->group(function(){
    Route::get('/',[OfferController::class,'index']);
    Route::get('/{id}',[OfferController::class,'show']);
    Route::post('/store',[OfferController::class,'store']);
    Route::post('/delete/{id}',[OfferController::class,'destroy']);

});



Route::prefix('cart')->group(function(){
    Route::get('/',[CartController::class,'index']);
    Route::get('/{id}',[CartController::class,'show']);
    Route::post('/store',[CartController::class,'store']);
    Route::post('/delete/{id}',[CartController::class,'destroy']);
    Route::post('addProduct',[CartController::class,'addProduct']);
    Route::post('checkout',[CartController::class,'checkout']);


});

Route::prefix('orders')->group(function(){
    Route::get('/',[OrderController::class,'index']);
    Route::get('/{id}',[OrderController::class,'show']);
    Route::post('/store',[OrderController::class,'store']);
    Route::post('/delete/{id}',[OrderController::class,'destroy']);

});
