<?php

namespace App\Repositories;

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
     * Get repayment by user
    */
    public function getByUser($userId, $id)
    {
        $repayment = DB::table('repayments')
            ->select('repayments.*')
            ->join('loans', 'loans.id', '=', 'repayments.loan_id')
            ->where('loans.user_id', $userId)
            ->where('repayments.id', $id)
            ->first();

        return $repayment;
    }

}
