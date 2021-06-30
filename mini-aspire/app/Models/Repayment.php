<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Repayment extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'loan_id',
        'amount',
        'pay_date',
        'paid',
        'paid_date',
        'paid_amount'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'loan_id' => 'integer',
        'amount' => 'double',
        'pay_date' => 'date',
        'paid' => 'boolean',
        'paid_date' => 'datetime',
    ];
}
