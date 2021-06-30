<?php

namespace App\Repositories;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

use App\Models\Loan;
use App\Models\Repayment;
use App\Repositories\BaseRepository;

class RepaymentRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'loan_id',
        'amount',
        'pay_date',
        'paid',
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Repayment::class;
    }

    /**
     * Create list of repayment for a loan
    */

    public function createForLoan(Loan $loan)
    {
        $query = $this->model->newQuery();
        $repaymentList = $this->_generateRepaymentList($loan);
        // $repayments = $query->upsert($repaymentList);
        $condition = [
            'loan_id',
            'pay_date',
        ];
        $updateFields = [
            // 'amount',
            // 'paid'
        ];
        $repayments = DB::table('repayments')->upsert($repaymentList, $condition, $updateFields);
        return $repayments;
        return $repaymentList;
    }

    private function _generateRepaymentList($loan)
    {
        // generate repayment dates
        $paydateEnd = Carbon::parse($loan->first_paydate)->addMonths($loan->duration);
        $period = Carbon::parse($loan->first_paydate)->toPeriod($paydateEnd, $loan->repayment_frequency.' months');   // n months

        // calculate monthly amount
        $totalPayTimes = $loan->duration / $loan->repayment_frequency;
        $payAmountMonthly = floor($loan->amount / $totalPayTimes);
        $payAmountRemain = $loan->amount - ($payAmountMonthly * $totalPayTimes);

        // monthly
        $repaymentList = [];

        foreach($period as $index => $date) {
            if ($index < $totalPayTimes) {
                $_amount = $payAmountMonthly;
            }else if($index == $totalPayTimes) {
                $_amount = $payAmountMonthly + $payAmountRemain;
            }

            $repaymentList [] = [
                'loan_id' => $loan->id,
                'amount' => $_amount,
                'pay_date' => $date->format('Y-m-d'),
                'paid' => false,
                'currency' => $loan->currency,
            ];
        }

        return $repaymentList;
    }
}
