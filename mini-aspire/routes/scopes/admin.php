<?php

/*
|--------------------------------------------------------------------------
| Admin API Routes
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'namespace' => 'Admin'], function () {

    // Public
    Route::group(['prefix' => 'auth'], function() {
        Route::post('login', 'AuthController@login')->name('auth.login');
    });

    // Authenticated
    Route::group(['middleware' => ['auth:admin'] ], function() {

        Route::group(['prefix' => 'auth'], function() {
            Route::get('profile', 'AuthController@user')->name('auth.profile');
            Route::put('profile', 'AuthController@update')->name('auth.profile.update');
            Route::post('logout', 'AuthController@logout')->name('auth.logout');
        });

        Route::group(['prefix' => 'users'], function() {
            Route::get('/', 'UserController@index');
            Route::post('/', 'UserController@create');
            Route::get('/{id}', 'UserController@detail');
            Route::put('/{id}', 'UserController@update');
            Route::delete('/{id}', 'UserController@delete');
        });

        Route::group(['prefix' => 'loans'], function() {
            Route::post('/', 'LoanController@create')->name('loans.create');
            Route::put('/', 'LoanController@update')->name('loans.update');
            Route::get('/', 'LoanController@index')->name('loans.list');
            Route::get('/{id}', 'LoanController@detail')->name('loans.detail');
        });
    });

});