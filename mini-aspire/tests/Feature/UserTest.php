<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\BaseTestCase;
use Tests\CreatesApplication;

use App\Models\User;

class UserTest extends BaseTestCase
{
    use CreatesApplication;

    public function test_user_login()
    {
        // Create new random user and do login
        $route = route('api.v1.auth.login');
        // echo " API - Client - User Login - $route \n";

        $user = User::factory()->create();
        $body = [
            'email' => $user->email,
            'password' => 'password', // default password is set in UserFactory
        ];

        $response = $this->postJson($route, $body);
        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
            ]);
    }

    public function test_user_profile()
    {
        $route = route('api.v1.user.profile');
        // echo " API - Client - User Profile - $route \n";

        list($user, $accessToken) = $this->getUser1();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);
        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
            ]);
    }

    public function test_user_profile_unauthenticated()
    {
        // Get user's profile when not login
        $route = route('api.v1.user.profile');
        // echo " API - Client - User Profile (Unauthenticated) - $route \n";

        list($user, $accessToken) = $this->getUser1();

        $response = $this->getJson($route);
        $response->assertStatus(401);
    }

}
