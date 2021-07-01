<?php

namespace App\Http\Resources\API\Admin;

use Illuminate\Http\Resources\Json\ResourceCollection;

class LoansResource extends ResourceCollection
{
    /**
     * The resource that this resource collects.
     *
     * @var string
     */
    public $collects = 'App\Http\Resources\API\Admin\LoanResource';

    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection;
    }
}
