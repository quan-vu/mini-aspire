<?php

namespace Tests\Feature\Client;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\BaseTestCase;
use Tests\CreatesApplication;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Loan;
use App\Repositories\LoanRepository;

class UserTest extends BaseTestCase
{
    use CreatesApplication;

    private $_userEmptyLoansStructure = [
        "success",
        "message",
        "data" => [
            "current_page",
            "per_page",
            "last_page",
            "total",
            "prev_page_url",
            "next_page_url",
            "items",
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
    
    private function _createLoanForuser($userId)
    {
        $route = route('api.admin.loans.create');

        list($admin, $adminAccessToken) = $this->getManagerUser();

        $body = [
            "user_id" => $userId,
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
    }

    public function test_user_login()
    {
        // Create new random user and do login
        $route = route('api.v1.auth.login');
        // echo " API - Client - User Login - $route \n";

        $user = User::factory()->create();
        $body = [
            'email' => $user->email,
            'password' => 'password', // default password is set in UserFactory
        ];

        $response = $this->postJson($route, $body);
        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
            ]);
    }

    public function test_user_profile()
    {
        $route = route('api.v1.user.profile');
        // echo " API - Client - User Profile - $route \n";

        list($user, $accessToken) = $this->getUser1();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);
        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
            ]);
    }

    public function test_user_profile_unauthenticated()
    {
        // Get user's profile when not login
        $route = route('api.v1.user.profile');
        // echo " API - Client - User Profile (Unauthenticated) - $route \n";

        list($user, $accessToken) = $this->getUser1();

        $response = $this->getJson($route);
        $response->assertStatus(401);
    }

    public function test_user_with_empty_loans()
    {
        $route = route('api.v1.user.loans');
        // echo " API - Client - User's Loans - $route \n";

        list($user, $accessToken) = $this->getUser1();

        // Delete all loans of this user
        $user->loans()->delete();

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);

        
        $response->assertStatus(200);
        $response->assertJsonStructure($this->_userEmptyLoansStructure);
    }

    public function test_user_has_loans()
    {
        $route = route('api.v1.user.loans');
        // echo " API - Client - User's Loans - $route \n";

        list($user, $accessToken) = $this->getUser2();

        // Be sure user has some loans
        $this->_createLoanForuser($user->id);

        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($route);

        
        $response
            ->assertStatus(200)
            ->assertJsonStructure($this->_loansPaginationStructure);
    }

    public function test_user_can_not_login_admin_route()
    {
        // Create new random user and do login
        $route = route('api.admin.auth.login');
        // echo " API - Client - User Login to Admin route - $route \n";

        $user = User::factory()->create();
        $body = [
            'email' => $user->email,
            'password' => 'password', // default password is set in UserFactory
        ];

        $response = $this->postJson($route, $body);
        $response->assertStatus(404);
    }

    public function test_user_can_make_repayment()
    {
        $routeUserLoans = route('api.v1.user.loans');

        list($user, $accessToken) = $this->getUser2();

        // Be sure user has some loans
        $this->_createLoanForuser($user->id);

        // Step 1: Get list of loans of users
        $response = $this->withHeaders([
                'Authorization' => 'Bearer '.$accessToken 
            ])->getJson($routeUserLoans);

        $responseData = $this->getResponseData($response);
        // // echo '<pre>';
        // print_r($responseData);

        // Step 2: Extract the first repayment from the first loan
        $repaymentId = $responseData['data']['items'][0]['repayments'][0]['id'];
        $repaymentAmount = $responseData['data']['items'][0]['repayments'][0]['amount'];
        $repaymentCurrency = $responseData['data']['items'][0]['repayments'][0]['currency'];

        // Step 3: Send request to make repayment of user
        $routeUserMakeRepayment = route('api.v1.user.make_repayment', ['id' => $repaymentId]);
        // echo " API - Client - User make a repayment - $routeUserMakeRepayment \n";

        $repaymentBody = [
            "currency" => $repaymentCurrency,
            "paid_amount" => $repaymentAmount
        ];

        $response = $this->withHeaders([
            'Authorization' => 'Bearer '.$accessToken 
        ])->putJson($routeUserMakeRepayment, $repaymentBody);
        
        // Result
        $response->assertStatus(200)
            ->assertJson(['success' => true])
            ->assertJsonPath('data.paid', true);

        // Step 3.1: Send request to make repayment with wrong amount
        $routeUserMakeRepayment = route('api.v1.user.make_repayment', ['id' => $repaymentId]);
        // echo " API - Client - User make a repayment with wrong amount - $routeUserMakeRepayment \n";

        $repaymentBody = [
            "currency" => $repaymentCurrency,
            "paid_amount" => 1
        ];

        $response = $this->withHeaders([
            'Authorization' => 'Bearer '.$accessToken 
        ])->putJson($routeUserMakeRepayment, $repaymentBody);
        
        // Result
        $response->assertStatus(403);
    }
}
