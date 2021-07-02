<?php 

namespace Tests;

use Tests\TestCase;
use Illuminate\Contracts\Console\Kernel;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class BaseTestCase extends TestCase
{

    protected function getManagerUser()
    {
        $user = User::updateOrCreate(
            ['email' => 'manager@example.com', ],
            [
                'name' => 'Manager', 
                'email' => 'manager@example.com', 
                'email_verified_at' => null, 
                'password' => Hash::make('password'), 
                'remember_token' => null,
            ]
        );

        $user->assignRole('manager');

        $accessToken = $user->createToken('Personal Access Token')->accessToken;

        return [$user, $accessToken];
    }

    protected function getEmployeeUser()
    {
        $user = User::updateOrCreate(
            ['email' => 'empoyee@example.com', ],
            [
                'name' => 'Employee', 
                'email' => 'empoyee@example.com', 
                'email_verified_at' => null, 
                'password' => Hash::make('password'), 
                'remember_token' => null,
            ]
        );

        $user->assignRole('empoyee');

        $accessToken = $user->createToken('Personal Access Token')->accessToken;

        return [$user, $accessToken];
    }

    protected function getUser1()
    {
        $user = User::updateOrCreate(
            ['email' => 'user1@example.com', ],
            [
                'name' => 'User 1', 
                'email' => 'user1@example.com', 
                'email_verified_at' => null, 
                'password' => Hash::make('password1'), 
                'remember_token' => null,
            ]
        );

        $tokenResult = $user->createToken('Personal Access Token');

        return [$user, $tokenResult->accessToken];
    }

    protected function getUser2()
    {
        $user = User::updateOrCreate(
            ['email' => 'user2@example.com', ],
            [
                'name' => 'User 2', 
                'email' => 'user2@example.com', 
                'email_verified_at' => null, 
                'password' => Hash::make('password2'), 
                'remember_token' => null,
            ]
        );

        $accessToken = $user->createToken('Personal Access Token')->accessToken;

        return [$user, $accessToken];
    }
    
}