<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\API\BaseController;
use App\Http\Requests\API\V1\LoanCreateAPIRequest;
use App\Repositories\LoanRepository;
use App\Repositories\RepaymentRepository;
use App\Http\Resources\LoanResource;

class LoanController extends BaseController
{
    private $_loanRepo;
    private $_repaymentRepo;

    public function __construct(
        LoanRepository $loanRepo,
        RepaymentRepository $repaymentRepo
    ) {
        $this->_loanRepo = $loanRepo;
        $this->_repaymentRepo = $repaymentRepo;
    }

    /**
     * Create a new user instance after a valid registration.
     */
    protected function create(LoanCreateAPIRequest $request)
    {
        try {
            $input = $request->validated();
            $loan = $this->_loanRepo->create($input);
            $this->_repaymentRepo->createForLoan($loan);
            return $this->success("Create loan successfully.", new LoanResource($loan)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Create a new user instance after a valid registration.
     */
    protected function detail($id)
    {
        try {
            $loan = $this->_loanRepo->find($id);
            return $this->success("Create loan successfully.", new LoanResource($loan)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

}
