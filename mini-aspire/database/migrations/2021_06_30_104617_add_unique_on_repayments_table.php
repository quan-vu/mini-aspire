<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUniqueOnRepaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasColumn('repayments', 'loan_id') && Schema::hasColumn('repayments', 'pay_date')) {
            Schema::table('repayments', function (Blueprint $table) {
                $table->unique(['loan_id', 'pay_date']);
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('repayments', function (Blueprint $table) {
            $table->dropUnique(['loan_id', 'pay_date']);
        });
    }
}
