<?php

use App\Http\Controllers\ClasseController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ForgotPasswordController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrganicStructureController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RetiredController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\RolePermissionController;
use App\Http\Controllers\SpecialistController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\generateStructureController;

use FontLib\Table\Type\name;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

// Login
Route::get('/', [LoginController::class, 'index'])->name('login.index');
Route::post('/login', [LoginController::class, 'loginProcess'])->name('login.process');
Route::get('/logout', [LoginController::class, 'destroy'])->name('login.destroy');
Route::get('/create-user-login', [LoginController::class, 'create'])->name('login.create-user');
Route::post('/store-user-login', [LoginController::class, 'store'])->name('login.store-user');

// Recuperar senha
Route::get('/forgot-password', [ForgotPasswordController::class, 'showForgotPassword'])->name('forgot-password.show');
Route::post('/forgot-password', [ForgotPasswordController::class, 'submitForgotPassword'])->name('forgot-password.submit');

Route::get('/reset-password/{token}', [ForgotPasswordController::class, 'showResetPassword'])->name('password.reset');
Route::post('/reset-password', [ForgotPasswordController::class, 'submitResetPassword'])->name('reset-password.submit');

Route::group(['middleware' => 'auth'], function () {
    // Dashboard
    Route::get('/index-dashboard', [DashboardController::class, 'index'])->name('dashboard.index');
    Route::get('/admin/dashboard', [DashboardController::class, 'especialistasPorRegiao'])->name('admin.dashboard');

    // Perfil
    Route::get('/show-profile', [ProfileController::class, 'show'])->name('profile.show');
    Route::get('/edit-profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::put('/update-profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/edit-profile-password', [ProfileController::class, 'editPassword'])->name('profile.edit-password');
    Route::put('/update-profile-password', [ProfileController::class, 'updatePassword'])->name('profile.update-password');

    // Usuários
    Route::get('/index-user', [UserController::class, 'index'])
        ->name('user.index')
        ->middleware('permission:index-user');
    Route::get('/show-user/{user}', [UserController::class, 'show'])
        ->name('user.show')
        ->middleware('permission:show-user');
    Route::get('/create-user', [UserController::class, 'create'])
        ->name('user.create')
        ->middleware('permission:create-user');
    Route::post('/store-user', [UserController::class, 'store'])
        ->name('user.store')
        ->middleware('permission:create-user');
    Route::get('/edit-user/{user}', [UserController::class, 'edit'])
        ->name('user.edit')
        ->middleware('permission:edit-user');
    Route::put('/update-user/{user}', [UserController::class, 'update'])
        ->name('user.update')
        ->middleware('permission:edit-user');
    Route::get('/edit-user-password/{user}', [UserController::class, 'editPassword'])
        ->name('user.edit-password')
        ->middleware('permission:edit-user-password');
    Route::put('/update-user-password/{user}', [UserController::class, 'updatePassword'])
        ->name('user.update-password')
        ->middleware('permission:edit-user-password');
    Route::delete('/destroy-user/{user}', [UserController::class, 'destroy'])
        ->name('user.destroy')
        ->middleware('permission:destroy-user');
          
       // Papéis
    Route::get('/index-role', [RoleController::class, 'index'])
        ->name('role.index')
        ->middleware('permission:index-role');
    Route::get('/create-role', [RoleController::class, 'create'])
        ->name('role.create')
        ->middleware('permission:create-role');
    Route::post('/store-role', [RoleController::class, 'store'])
        ->name('role.store')
        ->middleware('permission:create-role');
    Route::get('/edit-role/{role}', [RoleController::class, 'edit'])
        ->name('role.edit')
        ->middleware('permission:edit-role');
    Route::put('/update-role/{role}', [RoleController::class, 'update'])
        ->name('role.update')
        ->middleware('permission:edit-role');
    Route::delete('/destroy-role/{role}', [RoleController::class, 'destroy'])
        ->name('role.destroy')
        ->middleware('permission:destroy-role');

    // Permissão do papel
    Route::get('/index-role-permission/{role}', [RolePermissionController::class, 'index'])
        ->name('role-permission.index')
        ->middleware('permission:index-role-permission');
    Route::get('/update-role-permission/{role}/{permission}', [RolePermissionController::class, 'update'])
        ->name('role-permission.update')
        ->middleware('permission:update-role-permission');

    // Permissões ou páginas
    Route::get('/index-permission', [PermissionController::class, 'index'])->name('permission.index');
    Route::get('/show-permission/{permission}', [PermissionController::class, 'show'])->name('permission.show');
    Route::get('/create-permission', [PermissionController::class, 'create'])->name('permission.create');
    Route::post('/store-permission', [PermissionController::class, 'store'])->name('permission.store');
    Route::get('/edit-permission/{permission}', [PermissionController::class, 'edit'])->name('permission.edit');
    Route::put('/update-permission/{permission}', [PermissionController::class, 'update'])->name('permission.update');
    Route::delete('/destroy-permission/{permission}', [PermissionController::class, 'destroy'])->name('permission.destroy');

    //Especialista
    Route::get('/index-specialist', [SpecialistController::class, 'index'])->name('specialist.index')->middleware('permission:index-specialist');
    Route::get('/create-specialist', [SpecialistController::class, 'create'])->name('specialist.create')->middleware('permission:create-specialist');
    Route::get('show-specialist/{id}', [SpecialistController::class, 'show'])->name('specialist.show')->middleware('permission:show-specialist');
    Route::post('/store-specialist', [SpecialistController::class, 'store'])->name('specialist.store')->middleware('permission:create-specialist');
    Route::get('/edit-specialist/{id}', [SpecialistController::class, 'edit'])->name('specialist.edit')->middleware('permission:edit-specialist');
    Route::put('/update-specialist/{id}', [SpecialistController::class, 'update'])->name('specialist.update')->middleware('permission:edit-specialist');
    Route::delete('/delete-specialist/{id}', [SpecialistController::class, 'destroy'])->name('specialist.destroy')->middleware('permission:delete-specialist');
    Route::get('/specialist/{id}', [SpecialistController::class, 'ficha'])->name('relatorio.especialista');
    Route::post('/store-order', [SpecialistController::class, 'storeOrder'])->name('store.order')->middleware('permission:create-order');
    Route::post('/store-course', [SpecialistController::class, 'StoreCourse'])->name('store.course')->middleware('permission:create-course');
    Route::post('/store-sub', [SpecialistController::class, 'storeSubunidade'])->name('store.sub')->middleware('permission:create-sub');
    Route::post('/store-position', [SpecialistController::class, 'StoreCargo'])->name('store.position')->middleware('permission:create-position');


    // Reformados
    Route::get('/index-retired', [RetiredController::class, 'index'])->name('retired.index')->middleware('permission:index-retired');
    Route::get('/birthdate', [RetiredController::class, 'birthdate'])->name('birthdate')->middleware('permission:birthdate');
    Route::post('/aniversariantes/data', [RetiredController::class, 'data'])->name('aniversariantes.data')->middleware('permission:birthdate');
    Route::get('/reformados/pdf', [RetiredController::class, 'generatePDF'])->name('retired.pdf')->middleware('permission:reformados/pdf');
    //////////////////////

    //Estrutura Orgânica
    Route::get('/index-structure', [OrganicStructureController::class, 'index'])->name('structure.index')->middleware('permission:index-structure');
    //Estrutura Orgânica
    Route::get('/show-structure/{id}', [OrganicStructureController::class, 'show'])->name('structure.show')->middleware('permission:show-structure');
    //Estrutura Orgânica
    Route::get('/create-structure', [OrganicStructureController::class, 'create'])->name('structure.create')->middleware('permission:create-structure');
    //Estrutura Orgânica
    Route::post('/store-structure', [OrganicStructureController::class, 'store'])->name('structure.store')->middleware('permission:create-structure');
    Route::get('/edit-structure/{id}', [OrganicStructureController::class, 'edit'])->name('structure.edit')->middleware('permission:edit-structure');
    Route::put('/update-structure/{id}', [OrganicStructureController::class, 'update'])->name('structure.update')->middleware('permission:edit-structure');
    Route::delete('/destroy-structure{id}', [OrganicStructureController::class, 'destroy'])->name('structure.destroy')->middleware('permission:destroy-structure');
    Route::delete('/destroy-person/{id}', [OrganicStructureController::class, 'ApagarPessoaCargo'])->name('destroy.pessoa')->middleware('permission:destroy-person');
    Route::get('/comando', [OrganicStructureController::class, 'CadeiaComando'])->name('structure.head')->middleware('permission:comando');
    Route::get('/structure/search-militar', [OrganicStructureController::class, 'searchMilitar'])
        ->name('structure.searchMilitar');
    Route::post('/structure/{id}/add-person', [OrganicStructureController::class, 'AddPessoaCargo'])
    ->name('structure.addPerson')
    ->middleware('permission:add-person');
    //Gerar Estrutura
    // Tela de formulário e resultados da estrutura geral
    Route::get('/generate/general', [generateStructureController::class, 'generalView'])->name('structure.geral.view')->middleware('permission:generate/general');
    Route::post('/generate/general', [generateStructureController::class, 'geral'])->name('structure.geral')->middleware('permission:generate/general');

    // Tela de formulário e resultados da estrutura específica
    Route::get('/generate/specific', [generateStructureController::class, 'specificView'])->name('structure.specific.view')->middleware('permission:generate/specific');
    Route::post('/generate/specific', [generateStructureController::class, 'specific'])->name('structure.specific')->middleware('permission:generate/specific');

    /**região/Ueo/Subunidade*/
    Route::get('/get-ueos/{regiao}', [generateStructureController::class, 'getUeos']);
    Route::get('/get-subunidades/{ueo}', [generateStructureController::class, 'getSubunidades']);

});

/*Selects Dependentes*/

//Municipios de uma Provincia
Route::get('/municipios/{provinciaId}', function ($provinciaId) {
    $municipios = DB::table('municipio')->where('idprovincia', $provinciaId)->pluck('municipio', 'idmunicipio');

    return response()->json($municipios);
})->name('municipios.by.provincia');

// Zonas de um Município
Route::get('/zonas/{municipioId}', function ($municipioId) {
    $zonas = DB::table('zona')->where('idmunicipio', $municipioId)->pluck('zona', 'idzona');
    return response()->json($zonas);
})->name('zonas.by.municipio');

// Bairros de uma Zona
Route::get('/bairros/{zonaId}', function ($zonaId) {
    $bairros = DB::table('bairro')->where('idzona', $zonaId)->pluck('bairro', 'idbairro');
    return response()->json($bairros);
})->name('bairros.by.zona');

//Especialidades de um quadro Especial
Route::get('/especialidade/{quadroId}', function ($quadroId) {
    $especialidades = DB::table('especialidade')->where('id_quadro_especial', $quadroId)->pluck('nome_especialidade', 'id_especialidade');

    return response()->json($especialidades);
})->name('especialidades.by.quadroEspecial');

//Regiões de um Ramo
Route::get('/regioes/{ramoID}', function ($ramoID) {
    $regioes = DB::table('tbl_regiaomilitar')
        ->where('RamoID', $ramoID)
        ->select('CodRM as id', 'Designacao_RM as nome')
        ->get();

    return response()->json($regioes);
})->name('regioes.by.ramo');


//UEOs de umma Região
Route::get('/ueo/{regiaoID}', function ($regiaoID) {
    $ueo = DB::table('do_unidadesmilitares')->where('RM', $regiaoID)->pluck('Ueo', 'UnidadeID');

    return response()->json($ueo);
})->name('UEO.by.Regiao');

// Cargos de uma função
Route::get('/cargo/{funcaoId}', function ($funcaoId) {
    $cargo = DB::table('cargo')->where('id_funcao', $funcaoId)->pluck('nome_cargo', 'id_cargo');

    return response()->json($cargo);
})->name('cargo.by.funcao');

Route::get('/condicao/{situacaoId}', function ($situacaoId) {
    $situacao = DB::table('situacao_condicoes')->where('id_situacao', $situacaoId)->pluck('descricao', 'id');
    return response()->json($situacao);
})->name('condicao.by.situacao');

/* grupos de Linguas*/
Route::get('/linguas-por-grupo/{id}', function ($id) {
    $linguas = DB::table('tbl_tipos_linguas')
        ->where('grupoLingua', $id)
        ->orderBy('descricaoLingua')
        ->get();

    return response()->json($linguas);
})->name('linguas.por.grupo');

Route::get('/ordens/combos', function () {
    return response()->json([
        'entidades' => DB::table('tbl_entidade')
            ->where('estado', 1)
            ->select('id_entidade', 'Entidade_Abrev')
            ->get(),
        'tipos' => DB::table('tbl_tipoordem')
            ->select('CodTipoOrdem', 'Descricao_tipo_ordem')
            ->get()
    ]);
});

// Ordens por tipo
// web.php
Route::get('/ordens/by-tipo/{tipo}', function ($tipo) {
    $ordens = DB::table('tbl_ordens')
        ->join('tbl_entidade', 'tbl_ordens.idEntidade', '=', 'tbl_entidade.id_entidade')
        ->join('tbl_tipoordem', 'tbl_ordens.idTipoOrdem', '=', 'tbl_tipoordem.CodTipoOrdem')
        ->where('tbl_ordens.idTipoOrdem', $tipo)
        ->select(
            'tbl_ordens.id',
            'tbl_ordens.N_ORDEM',
            'tbl_ordens.DATA_ORDEM',
            'tbl_entidade.Entidade_Abrev'
        )
        ->get()
        ->map(function ($ordem) {
            $data = \Carbon\Carbon::parse($ordem->DATA_ORDEM)->locale('pt_BR');
            $ordem->referencia_ordem = $ordem->N_ORDEM . '/' . $ordem->Entidade_Abrev . '/' .
                $data->year . ', de ' . $data->day . ' de ' . $data->translatedFormat('F');
            return $ordem;
        });

    return response()->json($ordens);
})->name('ordens.by.tipo');




/*--!Fim selects Dependentes---*/
