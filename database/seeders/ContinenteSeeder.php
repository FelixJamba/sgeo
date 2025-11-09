<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class ContinenteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('continentes')->insert([
            ['id' => 1, 'nome' => 'África'],
            ['id' => 2, 'nome' => 'América'],
            ['id' => 3, 'nome' => 'Ásia'],
            ['id' => 4, 'nome' => 'Europa'],
            ['id' => 5, 'nome' => 'Oceania'],
            ['id' => 6, 'nome' => 'Antártida'],
        ]);
    }
}
