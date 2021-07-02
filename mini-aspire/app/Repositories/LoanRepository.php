<?php

namespace App\Repositories;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

use App\Models\Loan;
use App\Models\Repayment;
use App\Repositories\BaseRepository;

class LoanRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'user_id',
        'amount',
        'currency',
        'duration',
        'repayment_frequency',
        'interest_rate',
        'arrangement_fee',
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
        return Loan::class;
    }

    public function create($data)
    {
        try {
            DB::beginTransaction();
            $loan = $this->model->create($data);
            $loan->repayments()->saveMany($this->_generateRepaymentList($loan));
            $loan->refresh();
            DB::commit();
            return $loan;
        } catch (\Throwable $th) {
            throw $th;
            DB::rollBack();
        }
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

            $repaymentList [] = new Repayment([
                'loan_id' => $loan->id,
                'amount' => $_amount,
                'pay_date' => $date->format('Y-m-d'),
                'paid' => false,
                'currency' => $loan->currency,
            ]);
        }

        return $repaymentList;
    }
}
