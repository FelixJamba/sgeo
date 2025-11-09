<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if (!User::where('email', 'test@test.com')->first()) {
            $superAdmin = User::create([
                'name' => 'TestUser ',
                'email' => 'test@test.com',
                'password' => Hash::make('123456', ['rounds' => 12])
            ]);

            // Atribuir papel para o usuário
            $superAdmin->assignRole('Super Admin');
        }

        if (!User::where('email', 'kelly@test.com')->first()) {
            $admin = User::create([
                'name' => 'Kelly',
                'email' => 'kelly@test.com',
                'password' => Hash::make('123456a', ['rounds' => 12])
            ]);

            // Atribuir papel para o usuário
            $admin->assignRole('Admin');
        }

        if (!User::where('email', 'jessica@test.com')->first()) {
            $teacher = User::create([
                'name' => 'Jessica',
                'email' => 'jessica@test.com',
                'password' => Hash::make('123456a', ['rounds' => 12])
            ]);

            // Atribuir papel para o usuário
            $teacher->assignRole('Professor');
        }

        if (!User::where('email', 'gabrielly@test.com')->first()) {
            $tutor = User::create([
                'name' => 'Gabrielly',
                'email' => 'gabrielly@test.com',
                'password' => Hash::make('123456a', ['rounds' => 12])
            ]);

            // Atribuir papel para o usuário
            $tutor->assignRole('Tutor');
        }

        if (!User::where('email', 'marcos@test.com')->first()) {
            $student = User::create([
                'name' => 'Marcos',
                'email' => 'marcos@test.com',
                'password' => Hash::make('123456a', ['rounds' => 12])
            ]);

            // Atribuir papel para o usuário
            $student->assignRole('Aluno');
        }
    }
}
