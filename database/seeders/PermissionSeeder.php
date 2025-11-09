<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $permissions = [

            ['title'=> 'Listar usuários', 'name' => 'index-user'],
            ['title'=> 'Visualizar usuário', 'name' => 'show-user'],
            ['title'=> 'Cadastrar usuário', 'name' => 'create-user'],
            ['title'=> 'Editar usuário', 'name' => 'edit-user'],
            ['title'=> 'Editar senha do usuário', 'name' => 'edit-user-password'],
            ['title'=> 'Apagar usuário', 'name' => 'destroy-user'],
            ['title'=> 'Gerar PDF dos usuários', 'name' => 'generate-pdf-user'],
            ['title'=> 'Gerar CSV dos usuários', 'name' => 'generate-csv-user'],

            ['title'=> 'Estrutura - listar', 'name' => 'index-structure'],
            ['title'=> 'Estrutura - visualizar', 'name' => 'show-structure'],
            ['title'=> 'Estrutura - Cadastrar', 'name' => 'create-structure'],
            ['title'=> 'Estrutura - editar', 'name' => 'edit-structure'],
            ['title'=> 'Estrutura - remover', 'name' => 'destroy-structure'],

            // Estrutura - operações adicionais
            ['title'=> 'Estrutura - remover pessoa do cargo', 'name' => 'destroy-person'],
            ['title'=> 'Estrutura - cadeia de comando', 'name' => 'comando'],
            ['title'=> 'Estrutura - pesquisar militar', 'name' => 'structure.searchMilitar'],
            ['title'=> 'Estrutura - adicionar pessoa ao cargo', 'name' => 'add-person'], 

             // Estrutura - geração
            ['title'=> 'Estrutura - gerar geral', 'name' => 'generate/general'],
            ['title'=> 'Estrutura - gerar específica', 'name' => 'generate/specific'],


            ['title'=> 'Especialista - listar', 'name' => 'index-specialist'],
            ['title'=> 'Especialista - visualizar', 'name' => 'show-specialist'],
            ['title'=> 'Especialista - Cadastrar', 'name' => 'create-specialist'],
            ['title'=> 'Especialista - editar', 'name' => 'edit-specialist'],
            ['title'=> 'Especialista - remover', 'name' => 'delete-specialist'],

             // Reformados
            ['title'=> 'Listar reformados', 'name' => 'index-retired'],
            ['title'=> 'Listar aniversariantes por data', 'name' => 'birthdate'],
            ['title'=> 'Gerar PDF dos reformados', 'name' => 'reformados/pdf'],

            ['title' => 'Listar papéis', 'name' => 'index-role'],
            ['title' => 'Cadastrar papel', 'name' => 'create-role'],
            ['title' => 'Editar papel', 'name' => 'edit-role'],
            ['title' => 'Apagar papel', 'name' => 'destroy-role'],

            ['title' => 'Listar permissões do papel', 'name' => 'index-role-permission'],
            ['title' => 'Editar permissão do papel', 'name' => 'update-role-permission'],

            ['title'=> 'Listar páginas', 'name' => 'index-permission'],
            ['title'=> 'Visualizar página', 'name' => 'show-permission'],
            ['title'=> 'Cadastrar página', 'name' => 'create-permission'],
            ['title'=> 'Editar página', 'name' => 'edit-permission'],
            ['title'=> 'Apagar página', 'name' => 'destroy-permission'],
        ];

        foreach ($permissions as $permission) {
            $existingPermission = Permission::where('name', $permission['name'])->first();

            if (!$existingPermission) {
                Permission::create([
                    'title' => $permission['title'],
                    'name' => $permission['name'],
                    'guard_name' => 'web',
                ]);
            }
        }
    }
}
