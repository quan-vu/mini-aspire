<?php

namespace App\Http\Requests\API\V1;

use App\Http\Requests\API\BaseAPIRequest;

class UserRepaymentAPIRequest extends BaseAPIRequest
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
            'currency' => 'required',
            'paid_amount'     => 'required|integer|min:1',
        ];
    }

}
