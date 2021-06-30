<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'amount',
        'currency',
        'duration',
        'repayment_frequency',
        'interest_rate',
        'arrangement_fee',
        'first_paydate',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'user_id' => 'integer',
        'amount' => 'double',
        'currency' => 'string',
        'duration' => 'integer',
        'repayment_frequency' => 'integer',
        'interest_rate' => 'float',
        'arrangement_fee' => 'float',
        'first_paydate' => 'datetime'
    ];

    public function repayments()
    {
        return $this->hasMany('App\Models\Repayment');
    }
}
