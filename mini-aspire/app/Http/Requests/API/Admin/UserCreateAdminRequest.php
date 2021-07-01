<?php

namespace App\Http\Requests\API\Admin;

use App\Http\Requests\API\BaseAPIRequest;

class UserCreateAdminRequest extends BaseAPIRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|min:2|max:100',
            'email'     => 'required|max:255',
            'password'  => 'required|min:5',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Name is required!',
            'name.min' => 'Name must be at least 2 characters!',
            'email.required' => 'Emmail is required!',
            'password.required' => 'Password is required!',
            'password.min' => 'Password must be at least 5 characters!',
        ];
    }
}
