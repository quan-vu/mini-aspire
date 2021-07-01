<?php

namespace App\Http\Requests\API\Admin;

use App\Http\Requests\API\BaseAPIRequest;

class LoanCreateAdminRequest extends BaseAPIRequest
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
            'user_id' => 'required|integer',
            'amount' => 'required|integer',
            'currency' => 'required|string',
            'duration' => 'required|integer',
            'repayment_frequency' => 'required|integer',
            'interest_rate' => 'required',
            'arrangement_fee' => 'required',
            'first_paydate' => 'required',
        ];
    }

}
