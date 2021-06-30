<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LoanResource extends JsonResource
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
            "user_id" => $this->user_id,
            "amount" => $this->amount,
            "currency" => $this->currency,
            "duration" => $this->duration,
            "repayment_frequency" => $this->repayment_frequency,
            "interest_rate" => $this->interest_rate,
            "arrangement_fee" => $this->arrangement_fee,
            "updated_at" => $this->updated_at,
            "created_at" => $this->created_at,
            'repayments' => $this->repayments->count() ? new RepaymentsResource($this->repayments) : null,
        ];
    }
}
