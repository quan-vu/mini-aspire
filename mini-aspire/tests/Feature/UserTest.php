<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\BaseTestCase;

use App\Models\User;

class UserTest extends BaseTestCase
{
    /**
     * User login test.
     *
     * @return void
     */
    public function test_user_login()
    {
        $route = route('api.v1.auth.login');
        echo "API - Client - User Login - $route \n";

        // Create random user
        $user = User::factory()->create();
        $body = [
            'email' => $user->email,
            'password' => 'password',   // default in factory
        ];

        $response = $this->postJson($route, $body);
        // $response->dump();
        $response
            ->assertStatus(200)
            ->assertJson([
                'success' => true,
            ]);
    }
}
