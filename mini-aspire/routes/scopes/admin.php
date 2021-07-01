<?php

/*
|--------------------------------------------------------------------------
| Admin API Routes
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin'], function () {

    // Public
    Route::group(['prefix' => 'auth'], function() {
        Route::post('signup', 'AuthController@signup');
        Route::post('login', 'AuthController@login');
    });

    // Authenticated
    Route::group(['middleware' => ['auth:admin'] ], function() {

        Route::group(['prefix' => 'auth'], function() {
            Route::get('profile', 'AuthController@user');
            Route::put('profile', 'AuthController@update');
            Route::post('logout', 'AuthController@logout');
        });

        Route::group(['prefix' => 'users'], function() {
            Route::get('/', 'UserController@index');
            Route::post('/', 'UserController@create');
            Route::get('/{id}', 'UserController@detail');
            Route::put('/{id}', 'UserController@update');
            Route::delete('/{id}', 'UserController@delete');
        });

        Route::group(['prefix' => 'loans'], function() {
            Route::post('/', 'LoanController@create');
            Route::put('/', 'LoanController@update');
            Route::get('/', 'LoanController@index');
            Route::get('/{id}', 'LoanController@detail');
        });
    });

});