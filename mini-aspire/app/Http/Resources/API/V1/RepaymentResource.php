<?php

namespace App\Http\Resources\API\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class RepaymentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'loan_id' => $this->loan_id,
            'amount' => $this->amount,
            'pay_date' => $this->pay_date,
            'currency' => $this->currency,
            'paid' => boolval($this->paid),
            'paid_date' => $this->paid_date,
            'paid_amount' => $this->paid_amount,
        ];
    }
}
