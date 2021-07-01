<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role as LaravelRole;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        LaravelRole::upsert([
                ['name' => 'superadmin', 'guard_name' => 'admin'],
                ['name' => 'manager', 'guard_name' => 'admin'],
                ['name' => 'employee', 'guard_name' => 'admin'],
            ], 
            ['name', 'guard_name'], // condition
            ['name', 'guard_name']  // Update fields
        );
    }
}
