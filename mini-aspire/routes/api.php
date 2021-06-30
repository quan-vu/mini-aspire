<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\V1\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can signup API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'v1', 'as' => 'v1.'], function () {

    // Public
    Route::group(['prefix' => 'auth'], function() {
        Route::post('signup', 'AuthController@signup');
        Route::post('login', 'AuthController@login');
    });

    // Authenticated
    Route::group(['middleware' => ['auth:api'] ], function() {

        Route::group(['prefix' => 'auth'], function() {
            Route::get('user', 'AuthController@user');
            Route::post('logout', 'AuthController@logout');
        });

        Route::group(['prefix' => 'loans'], function() {
            Route::post('', 'LoanController@create');
            Route::put('', 'LoanController@update');
            Route::get('/{id}', 'LoanController@detail');
        });

        Route::group(['prefix' => 'repayments'], function() {
            Route::put('/{id}', 'RepaymentController@update');
        });
   });
   
});