<?php

namespace App\Http\Controllers\API\Admin;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

use App\Http\Controllers\API\BaseAdminController;
use App\Http\Requests\API\Admin\UserSignupAdminRequest;
use App\Http\Requests\API\Admin\UserLoginAdminRequest;
use App\Http\Resources\API\Admin\AuthUserResource;

use App\Models\User;

class AuthController extends BaseAdminController
{
    public function __construct() {}

    public function login(UserLoginAdminRequest $request)
    {
        $input = $request->validated();
            
        $user = User::where('email', $input['email'])->first();
        if($user)
        {
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

    /**
     * Retrieve authenticated user
     *
     * @return [Object] User
     */
    public function user(Request $request)
    {
        return $this->success('Retrieve user successfully.', new AuthUserResource($request->user()));
    }

}
