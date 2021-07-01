<?php

namespace App\Http\Controllers\API\Admin;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Http\Controllers\API\BaseAdminController;
use App\Http\Resources\API\Admin\UsersResource;
use App\Http\Resources\API\Admin\UserResource;
use App\Http\Requests\API\Admin\UserCreateAdminRequest;
use App\Http\Requests\API\Admin\UserUpdateAdminRequest;
use App\Repositories\RepaymentRepository;
use App\Repositories\Admin\UserRepository;

class UserController extends BaseAdminController
{
    private $_userRepo;

    public function __construct(
        UserRepository $userRepo
    ) {
        $this->_userRepo = $userRepo;
    }

    /**
     * Get list of users.
     */
    protected function index(Request $request)
    {
        try {
            $filter = [
                'page_size' => $request->input('page_size'),
                'page' => $request->input('page'),
                'search' => $request->input('search'),
                'condition' => [],
            ];
            $userPaginate = $this->_userRepo->paginate($filter);
            return $this->successWithPaginate("Retrieve user's users successfully.", $userPaginate, 'UsersResource'); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Create a new user.
     */
    protected function create(UserCreateAdminRequest $request)
    {
        try {
            $input = $request->validated();
            $user = $this->_userRepo->create($input);
            return $this->success("Create user successfully.", new UserResource($user), 201); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Update a user.
     */
    protected function update($id, UserUpdateAdminRequest $request)
    {
        try {
            $input = $request->validated();

            if(!empty($input['password'])){
                $input['password'] = Hash::make($input['password']);
            }

            $user = $this->_userRepo->update($id, $input);
            return $this->success("Update user successfully.", new UserResource($user)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Delete a user.
     */
    protected function delete($id)
    {
        try {
            $user = $this->_userRepo->find($id);

            if(! $user) {
                return $this->error("User not found with ID $id!", 404);
            }

            if ($user->hasLoan()) {
                return $this->error("Can not delete a user who has some loans!", 403);
            }

            $user->delete();

            return $this->success("Delete user successfully."); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Get detail by id.
     */
    protected function detail($id)
    {
        try {
            $user = $this->_userRepo->find($id);
            return $this->success("Retrieve user successfully.", new UserResource($user)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

}
