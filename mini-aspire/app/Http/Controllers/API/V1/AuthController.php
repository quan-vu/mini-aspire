<?php

namespace App\Http\Controllers\API\V1;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\Http\Controllers\API\BaseController;
use App\Http\Requests\API\V1\UserSignupAPIRequest;
use App\Http\Requests\API\V1\UserLoginAPIRequest;
use App\Models\User;

class AuthController extends BaseController
{
    public function __construct() {}

    /**
     * Create a new user instance after a valid registration.
     */
    protected function signup(UserSignupAPIRequest $request)
    {
        try {
            $input = $request->validated();

            // Check user exist
            $user = User::where('email', $input['email'])->first();
            if ($user) {
                return $this->error("Email is already signuped!", 409); // 409 Conflict
            }

            // Create new user
            $user = User::forceCreate([
                'name' => $request['name'],
                'email' => $request['email'],           
                'password' => Hash::make($request['password']),
            ]);

            $tokenResult = $user->createToken('Personal Access Token');

            return $this->success("Register successfully.", [
                'access_token' => $tokenResult->accessToken,
                'token_type' => 'Bearer',
                'expires_at' => $tokenResult->token->expires_at,
            ]);
            
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    public function login(UserLoginAPIRequest $request)
    {
        $input = $request->validated();
            
        $user = User::where('email', $input['email'])->first();
        if(! $user){
            return $this->error("User not found!", 404);
        } else {
            if (! Hash::check($input['password'], $user->password))
            {
                return response()->json([
                    'message' => 'Email or password is incorrect!'
                ], 403);
            }

            // Generate access token 
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->token;
            $token->save();

            return $this->success("Login successfully.", [
                'access_token' => $tokenResult->accessToken,
                'token_type' => 'Bearer',
                'expires_at' => $tokenResult->token->expires_at,
            ]);
        }
    }

    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        try {
            $request->user()->token()->revoke();
            return $this->success('Logged out successfully.');
        } catch (\Throwable $th) {
            // throw $th;
            return $this->error('Error when logging out!', 500);
        }
    }

}
