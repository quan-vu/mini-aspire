<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\BaseTestCase;
use Tests\CreatesApplication;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Loan;
use App\Repositories\LoanRepository;

class LoanAdminTest extends BaseTestCase
{
    use CreatesApplication;

    private $_loanStructure = [
        "success",
        "message",
        "data" => [
            "id",
            "user_id",
            "amount",
            "currency",
            "duration",
            "repayment_frequency",
            "interest_rate",
            "arrangement_fee",
            "updated_at",
            "created_at",
            "repayments" => [
                "*" => [
                    "id",
                    "loan_id",
                    "amount",
                    "pay_date",
                    "paid",
                    "currency",
                ]
            ]
        ],
    ];

    private $_loansPaginationStructure = [
        "success",
        "message",
        "data" => [
            "current_page",
            "per_page",
            "last_page",
            "total",
            "prev_page_url",
            "next_page_url",
            "items" => [
                "*" => [
                    "id",
                    "user_id",
                    "amount",
                    "currency",
                    "duration",
                    "repayment_frequency",
                    "interest_rate",
                    "arrangement_fee",
                    "updated_at",
                    "created_at",
                    "repayments" => [
                        "*" => [
                            "id",
                            "loan_id",
                            "amount",
                            "pay_date",
                            "paid",
                            "currency",
                        ]
                    ]
                ]
            ],
        ],
    ];
    
    public function test_create_loan_for_user()
    {
        $route = route('api.admin.loans.create');
        // echo " API - Admin - Loan Create - $route \n";

        list($user, $accessToken) = $this->getUser2();
        list($admin, $adminAccessToken) = $this->getManagerUser();

        $body = [
            "user_id" => $user->id,
            "amount" => 14005,
            "currency" => "USD",
            "duration" => 12,
            "repayment_frequency" => 3,
            "interest_rate" => 0.23,
            "arrangement_fee" => 0.1,
            "first_paydate" => Carbon::now()
        ];

        // Admin can create loan for user only
        $response = $this->withHeaders([
            'Authorization' => 'Bearer '.$adminAccessToken 
        ])->postJson($route, $body);

        $response
            ->assertStatus(201)
            ->assertJsonStructure($this->_loanStructure);
    }

    public function test_admin_manager_can_get_loans_list()
    {
        $route = route('api.admin.loans.list');
        // echo " API - Admin - Loan List - $route \n";

        list($user, $accessToken) = $this->getManagerUser();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);
        
        $response
            ->assertStatus(200)
            ->assertJsonStructure($this->_loansPaginationStructure);
    }

    public function test_admin_employee_can_get_loans_list()
    {
        $route = route('api.admin.loans.list');
        // echo " API - Admin - Loan List - $route \n";

        list($user, $accessToken) = $this->getEmployeeUser();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);
        
        $response
            ->assertStatus(200)
            ->assertJsonStructure($this->_loansPaginationStructure);
    }

    public function test_user_can_not_get_loans_list()
    {
        $route = route('api.admin.loans.list');
        // echo " API - Admin - Loan List - $route \n";

        list($user, $accessToken) = $this->getUser2();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);
        
        $response->assertStatus(401);
    }
}
