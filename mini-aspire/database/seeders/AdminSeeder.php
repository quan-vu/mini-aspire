<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\Admin;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Admin::updateOrCreate(
            ['id' => 1, 'email' => 'superadmin@example.com', ],
            [
                'name' => 'Super Admin', 
                'email' => 'superadmin@example.com', 
                'email_verified_at' => null, 
                'password' => Hash::make('superpass'), 
                'remember_token' => null,
            ]
        );
    }
}