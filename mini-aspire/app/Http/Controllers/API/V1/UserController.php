<?php

namespace App\Http\Controllers\API\V1;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController;
use App\Repositories\RepaymentRepository;
use App\Repositories\LoanRepository;
use App\Http\Requests\API\V1\UserRepaymentAPIRequest;
use App\Http\Resources\API\V1\UserProfileResource;
use App\Http\Resources\API\V1\LoansResource;
use App\Http\Resources\API\V1\RepaymentResource;

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
     * Retrieve authenticated user
     *
     * @return object User
     */
    public function profile(Request $request)
    {
        return $this->success('Retrieve user successfully.', new UserProfileResource($request->user()));
    }

    /**
     * Get user's loans.
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
                return $this->success("Repayment is paid already.", new RepaymentResource($userRepayment));
            }

            $data = [
                'paid_date' => Carbon::now(),
                'paid' => true,
                'paid_amount' => doubleval($input['paid_amount']),
            ];
            
            $userRepayment = $this->_repaymentRepo->update($id, $data);

            return $this->success("Make repayment successfully.", new RepaymentResource($userRepayment)); 
        } catch (\Exception $e) {
            throw $e;
            return $this->error("Something when wrong!", 500);
        }
    }
    

}
