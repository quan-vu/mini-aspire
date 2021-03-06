<?php

namespace App\Http\Resources\API\Admin;

use Illuminate\Http\Resources\Json\JsonResource;

class AuthAdminResource extends JsonResource
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
            'email' => $this->email,
            'name' => $this->name,
            'is_verified_email' => $this->email_verified_at ? TRUE : FALSE
        ];
    }
}
