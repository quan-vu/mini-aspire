<?php

namespace App\Repositories;

use App\Models\Loan;
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
        $loan = $this->model->create($data);
        
        return $loan;
    }
}
