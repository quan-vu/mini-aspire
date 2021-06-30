<?php

namespace App\Http\Controllers\API\V1;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController;
use App\Repositories\RepaymentRepository;
use App\Repositories\LoanRepository;
use App\Http\Resources\LoansResource;
use App\Http\Requests\API\V1\UserRepaymentAPIRequest;

class UserController extends BaseController
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
    protected function userLoans(Request $request)
    {
        try {
            $user = $request->user();

            $filter = [
                'page_size' => $request->input('page_size'),
                'page' => $request->input('page'),
                'search' => $request->input('search'),
                'condition' => [
                    'user_id' => $user->id,
                ],
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
     * User make repayment.
     */
    protected function makeRepayment($id, UserRepaymentAPIRequest $request)
    {
        try {
            $input = $request->validated();
            $user = $request->user();
            $userRepayment = $this->_repaymentRepo->getByUser($user->id, $id);

            if(! $userRepayment) {
                return $this->error("Repayment not found!", 404);
            }

            if( doubleval($input['paid_amount']) < doubleval($userRepayment->amount) ) {
                return $this->error("Payment amount must be at least: ".number_format($userRepayment->amount)." $userRepayment->currency.", 403);
            }

            if($userRepayment->paid) {
                return $this->success("Repayment is paid already.", $userRepayment);
            }

            $data = [
                'paid_date' => Carbon::now(),
                'paid' => true,
                'paid_amount' => doubleval($input['paid_amount']),
            ];
            
            $userRepayment = $this->_repaymentRepo->update($id, $data);

            return $this->success("Make repayment successfully.", $userRepayment); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }

}
