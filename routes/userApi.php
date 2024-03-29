<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\User\AuthinticationController;





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

Route::post('user/register',[AuthinticationController::class,'register']);

Route::post('user/login',[AuthinticationController::class,'login']);

Route::middleware('auth:user-api')->group(function(){

    Route::post('user/logout',[AuthinticationController::class,'logout']);

});

