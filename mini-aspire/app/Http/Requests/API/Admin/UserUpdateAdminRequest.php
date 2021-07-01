<?php

namespace App\Http\Requests\API\Admin;

use App\Http\Requests\API\BaseAPIRequest;

class UserUpdateAdminRequest extends BaseAPIRequest
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
            'name' => 'min:2|max:100',
            'password'  => 'min:5',
        ];
    }

}
