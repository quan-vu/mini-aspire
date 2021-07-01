<?php

namespace App\Http\Controllers\API\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAdminController;
use App\Http\Requests\API\Admin\LoanCreateAdminRequest;
use App\Repositories\LoanRepository;
use App\Repositories\RepaymentRepository;
use App\Http\Resources\API\Admin\LoanResource;

class LoanController extends BaseAdminController
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

    protected function index(Request $request)
    {
        try {
            $filter = [
                'page_size' => $request->input('page_size'),
                'page' => $request->input('page'),
                'search' => $request->input('search'),
                'condition' => [],
                'relations' => ['repayments']
            ];
            $userLoansPaginate = $this->_loanRepo->paginate($filter);
            return $this->successWithPaginate("Retrieve user's loans successfully.", $userLoansPaginate, 'LoansResource'); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Create  a loan.
     */
    protected function create(LoanCreateAdminRequest $request)
    {
        try {
            $input = $request->validated();
            $loan = $this->_loanRepo->create($input);
            $this->_repaymentRepo->createForLoan($loan);
            return $this->success("Create loan successfully.", new LoanResource($loan), 201); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

    /**
     * Retrieve a loan by id.
     */
    protected function detail($id)
    {
        try {
            $loan = $this->_loanRepo->find($id);
            return $this->success("Retrieve loan successfully.", new LoanResource($loan)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

}
