@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <div class="d-flex justify-content-between align-items-start mb-4">
            <div>
                <h2 class="h3 mb-0 text-gray-800">
                    <i class="fas fa-user-edit text-dark me-2"></i> Editar Especialista
                </h2>
            </div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 bg-transparent p-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('dashboard.index') }}" class="text-decoration-none">
                            <i class="fas fa-home me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('specialist.index') }}" class="text-decoration-none">
                            <i class="fas fa-user-graduate me-1"></i>Especialistas
                        </a>
                    </li>
                    <li class="breadcrumb-item active text-dark">Editar</li>
                </ol>
            </nav>
        </div>
        <div class="card shadow mb-4 border-0">
            <div class="card-header bg-nav text-white py-3 d-flex justify-content-between align-items-center">
                <h5 class="mb-0">
                    <i class="fas fa-user-edit me-2"></i> Formulário de Edição
                </h5>

                <div>
                    @can('create-specialist')
                        <a href="{{ route('specialist.create') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle me-1"></i> Cadastrar
                        </a>
                    @endcan

                    @can('show-specialist')
                        <a href="{{ route('specialist.show', $specialist->id_pessoa_fisica) }}" class="btn btn-light btn-sm">
                            <i class="fas fa-eye me-1"></i> Visualizar
                        </a>
                    @endcan
                </div>
            </div>

            <div class="card-body">
                <form action="{{ route('specialist.update', $specialist->id_pessoa_fisica) }}" method="POST"
                    enctype="multipart/form-data" id="specialistForm">
                    @csrf
                    @method('PUT')

                    <x-alert />

                    <ul class="nav nav-tabs nav-justified mb-4 flex-nowrap" id="specialistTab" role="tablist"
                        style="overflow-x: auto; white-space: nowrap;">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="dados-pessoais-tab" data-bs-toggle="tab"
                                data-bs-target="#dados-pessoais" type="button" role="tab"
                                aria-controls="dados-pessoais" aria-selected="true">
                                <i class="fas fa-user me-1"></i> Dados Pessoais
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="dados-militares-tab" data-bs-toggle="tab"
                                data-bs-target="#dados-militares" type="button" role="tab"
                                aria-controls="dados-militares" aria-selected="false">
                                <i class="fas fa-shield-alt me-1"></i> Militares
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="historico-tab" data-bs-toggle="tab" data-bs-target="#historico"
                                type="button" role="tab" aria-controls="historico" aria-selected="false">
                                <i class="fas fa-history me-1"></i> Histórico
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="formacao-tab" data-bs-toggle="tab" data-bs-target="#formacao"
                                type="button" role="tab" aria-controls="formacao" aria-selected="false">
                                <i class="fas fa-graduation-cap me-1"></i> Formação
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="documentacao-tab" data-bs-toggle="tab"
                                data-bs-target="#documentacao" type="button" role="tab" aria-controls="documentacao"
                                aria-selected="false">
                                <i class="fas fa-file-alt me-1"></i> Documentos
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="contactos-tab" data-bs-toggle="tab" data-bs-target="#contactos"
                                type="button" role="tab" aria-controls="contactos" aria-selected="false">
                                <i class="fas fa-phone me-1"></i> Contactos
                            </button>
                        </li>

                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="linguas-tab" data-bs-toggle="tab" data-bs-target="#linguas"
                                type="button" role="tab" aria-controls="linguas" aria-selected="false">
                                <i class="fas fa-language me-1"></i>Línguas Faladas
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="agregado-familiar-tab" data-bs-toggle="tab"
                                data-bs-target="#agregado-familiar" type="button" role="tab"
                                aria-controls="agregado-familiar" aria-selected="false">
                                <i class="fas fa-users me-1"></i> Agregado
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="foto-tab" data-bs-toggle="tab" data-bs-target="#foto"
                                type="button" role="tab" aria-controls="foto" aria-selected="false">
                                <i class="fas fa-camera me-1"></i> Foto
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content p-3 border border-top-0 rounded-bottom" id="specialistTabContent">

                        <!-- Aba: Dados Pessoais -->
                        <div class="tab-pane fade show active" id="dados-pessoais" role="tabpanel"
                            aria-labelledby="dados-pessoais-tab">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="nome" class="form-label">Nome Completo <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="nome" id="nome" class="form-control"
                                        value="{{ old('nome', $specialist->nome) }}">
                                </div>
                                <div class="col-md-6">
                                    <label for="alcunha" class="form-label">Alcunha <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="alcunha" id="alcunha" class="form-control"
                                        value="{{ old('alcunha', $specialist->Alcunha) }}">
                                </div>

                                <div class="col-md-4">
                                    <label for="data_nascimento" class="form-label">Data de Nascimento <span
                                            class="text-danger">*</span></label>
                                    <input type="date" name="data_nascimento" id="data_nascimento"
                                        class="form-control"
                                        value="{{ old('data_nascimento', $specialist->Data_Nascimento) }}">
                                </div>

                                <div class="col-md-4">
                                    <label for="id_sexo" class="form-label">Sexo <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_sexo" id="id_sexo" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($sexos as $sexo)
                                            <option value="{{ $sexo->id_sexo }}"
                                                {{ old('id_sexo', $specialist->id_sexo) == $sexo->id_sexo ? 'selected' : '' }}>
                                                {{ $sexo->id_sexo }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="id_estado_civil" class="form-label">Estado Civil <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_estado_civil" id="id_estado_civil" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($estadosCivis as $estado)
                                            <option value="{{ $estado->id_estado_civil }}"
                                                {{ old('id_estado_civil', $specialist->id_estado_civil) == $estado->id_estado_civil ? 'selected' : '' }}>
                                                {{ $estado->estado_civil }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="id_provincia" class="form-label">Nascimento
                                        <span class="text-secondary">*</span>
                                    </label>
                                    <select name="id_provincia" id="id_provincia" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($provincias as $provincia)
                                            <option value="{{ $provincia->idprovincia }}"
                                                {{ old('id_provincia', $specialist->id_provincia_nascimento ?? '') == $provincia->idprovincia ? 'selected' : '' }}>
                                                {{ $provincia->provincia }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>


                                <div class="col-md-3">
                                    <label for="idmunicipio" class="form-label">Município <span
                                            class="text-secondary">*</span></label>
                                    <select name="idmunicipio" id="idmunicipio" class="form-select">
                                        <option value="">Selecione o Município</option>
                                        @if (!empty($municipios))
                                            @foreach ($municipios as $municipio)
                                                <option value="{{ $municipio->idmunicipio }}"
                                                    {{ old('idmunicipio', $specialist->id_naturalidade ?? '') == $municipio->idmunicipio ? 'selected' : '' }}>
                                                    {{ $municipio->municipio }}
                                                </option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="nome_pai" class="form-label">Nome do Pai <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="nome_pai" id="nome_pai" class="form-control"
                                        value="{{ old('nome_pai', $specialist->nome_pai) }}">
                                </div>
                                <div class="col-md-3">
                                    <label for="nome_mae" class="form-label">Nome da Mãe <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="nome_mae" id="nome_mae" class="form-control"
                                        value="{{ old('nome_mae', $specialist->nome_mae) }}">
                                </div>

                                <div class="col-md-3">
                                    <label for="id_provincia_residencia" class="form-label">Residência <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_provincia_residencia" id="id_provincia_residencia"
                                        class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($provincias as $provincia)
                                            <option value="{{ $provincia->idprovincia }}">{{ $provincia->provincia }}
                                            </option>
                                        @endforeach

                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="id_municipio_residencia" class="form-label">Município <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_municipio_residencia" id="id_municipio_residencia"
                                        class="form-select">
                                        <option value="">Selecione o Município</option>
                                        <!-- preenchido dinamicamente via JS -->
                                    </select>
                                </div>


                                <div class="col-md-3">
                                    <label for="id_zona" class="form-label">Zona <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_zona" id="id_zona" class="form-select">
                                        <option value="">Selecione a Zona</option>
                                        <!-- preenchido via JS -->
                                    </select>
                                </div>


                                <div class="col-md-3">
                                    <label for="id_bairro" class="form-label">Bairro <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_bairro" id="id_bairro" class="form-select">
                                        <option value="{{ old('id_bairro', $specialist->idbairro ?? '') }}" selected>
                                            Actual</option>
                                    </select>
                                </div>


                                <div class="col-md-6">
                                    <label for="endereco" class="form-label">Endereço <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="endereco" id="endereco" class="form-control"
                                        value="{{ old('endereco', $specialist->endereco) }}">
                                </div>

                                <div class="col-md-3">
                                    <label for="grupo_sanguineo" class="form-label">Grupo Sanguíneo <span
                                            class="text-secondary">*</span></label>
                                    <select name="grupo_sanguineo" id="grupo_sanguineo" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($grupoSanguineo as $grupo)
                                            <option value="{{ $grupo->idGSangue }}"
                                                {{ old('grupo_sanguineo', $specialist->Grupo_Sanguineo) == $grupo->idGSangue ? 'selected' : '' }}>
                                                {{ $grupo->Tipo_Sanguinio }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="altura" class="form-label">Altura (m) <span
                                            class="text-secondary">*</span></label>
                                    <input type="number" name="altura" id="altura" class="form-control"
                                        value="{{ old('altura', $specialist->Altura) }}" step="0.01" min="0"
                                        max="3">
                                </div>

                                <div class="col-md-4">
                                    <label for="Nro_Calcado" class="form-label">Nº Calçado <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="Nro_Calcado" id="Nro_Calcado" class="form-control"
                                        value="{{ old('Nro_Calcado', $specialist->Nro_Calcado) }}">
                                </div>
                                <div class="col-md-4">
                                    <label for="Nro_Camisa" class="form-label">Nº Camisa <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="Nro_Camisa" id="Nro_Camisa" class="form-control"
                                        value="{{ old('Nro_Camisa', $specialist->Nro_Camisa) }}">
                                </div>
                                <div class="col-md-4">
                                    <label for="Nro_Calca" class="form-label">Nº Calça <span
                                            class="text-secondary">*</span></label>
                                    <input type="text" name="Nro_Calca" id="Nro_Calca" class="form-control"
                                        value="{{ old('Nro_Calca', $specialist->Nro_Calca) }}">
                                </div>

                                <div class="col-md-6">
                                    <label for="habilitacao_id" class="form-label">Habilitação Literária <span
                                            class="text-secondary">*</span></label>
                                    <select name="habilitacao_id" id="habilitacao_id" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($habilitacoes as $habilitacao)
                                            <option value="{{ $habilitacao->habilitacao_id }}"
                                                {{ old('habilitacao_id', $specialist->habilitacao_id) == $habilitacao->habilitacao_id ? 'selected' : '' }}>
                                                {{ $habilitacao->descricao }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Aba: Dados Militares -->
                        <div class="tab-pane fade" id="dados-militares" role="tabpanel"
                            aria-labelledby="dados-militares-tab">
                            <div class="row g-3 mb-3">

                                <div class="col-md-4">
                                    <label for="nip" class="form-label">NIP <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="nip" id="nip" class="form-control"
                                        value="{{ old('nip', $specialist->nip) }}">
                                </div>

                                <div class="col-md-4">
                                    <label for="id_posto_organico" class="form-label">Posto <span
                                            class="text-danger">*</span></label>
                                    <select name="id_posto_organico" id="id_posto_organico" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($postos as $posto)
                                            <option value="{{ $posto->Posto_Id }}"
                                                {{ old('id_posto_organico', $specialist->id_patente) == $posto->Posto_Id ? 'selected' : '' }}>
                                                {{ $posto->Posto }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="quadro_especial" class="form-label">Quadro Especial
                                        <span class="text-secondary">*</span>
                                    </label>
                                    <select name="quadro_especial" id="quadro_especial" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($quadroEspecial as $item)
                                            <option value="{{ $item->Classe_Id }}"
                                                {{ old('quadro_especial', $specialist->id_quadro_especial ?? '') == $item->Classe_Id ? 'selected' : '' }}>
                                                {{ $item->Classe }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>


                                <div class="col-md-4">
                                    <label for="especialidade" class="form-label">Especialidade <span
                                            class="text-secondary">*</span></label>
                                    <select name="especialidade" id="especialidade" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($especialidades as $especialidade)
                                            <option value="{{ $especialidade->id_especialidade }}"
                                                {{ old('especialidade', $specialist->id_especialidade ?? '') == $especialidade->id_especialidade ? 'selected' : '' }}>
                                                {{ $especialidade->nome_especialidade }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="FPS" class="form-label">FPS <span
                                            class="text-secondary">*</span></label>
                                    <select name="FPS" id="FPS" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($fps as $fp)
                                            <option value="{{ $fp->Sitq_Id }}"
                                                {{ old('FPS', $specialist->FPS) == $fp->Sitq_Id ? 'selected' : '' }}>
                                                {{ $fp->Situacao_Quadro }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="id_situacao" class="form-label">Situação de Serviço <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_situacao" id="id_situacao" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($situacaoServico as $item)
                                            <option value="{{ $item->id_situacao }}"
                                                {{ old('id_situacao', $specialist->id_situacao_servico ?? '') == $item->id_situacao ? 'selected' : '' }}>
                                                {{ $item->nome_situacao }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="id_condicao" class="form-label">Condição <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_condicao" id="id_condicao" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($condicoesMilitares as $condicao)
                                            <<option value="{{ $condicao->id }}"
    {{ old('id_condicao', $specialist->id_condicao) == $condicao->id ? 'selected' : '' }}>
    {{ $condicao->descricao }}
</option>

                                        @endforeach
                                    </select>
                                </div>                               
                            </div>

                            <!-- Card: Incorporações -->
                            <div class="card mb-4">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0">
                                        <i class="fas fa-calendar-plus me-2"></i>Incorporações
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Edite ou adicione as incorporações do especialista (tipo, data e local).
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="incorporacoes-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-4">Tipo de Incorporação <span
                                                    class="text-secondary">*</span></div>
                                            <div class="col-md-3">Data <span class="text-secondary">*</span></div>
                                            <div class="col-md-4">Local <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas existentes -->
                                        @forelse ($specialist->incorporacoes as $i => $inc)
                                            <div class="incorporacao-entry row g-3 align-items-end mb-2">
                                                <!-- Tipo de Incorporação -->
                                                <div class="col-md-4">
                                                    <select
                                                        name="incorporacoes[{{ $i }}][id_tipo_incorporacao]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipo_Incorporacao as $tipo)
                                                            <option value="{{ $tipo->id_tipo }}"
                                                                {{ old("incorporacoes.$i.id_tipo_incorporacao", $inc->id_tipo_incorporacao) == $tipo->id_tipo ? 'selected' : '' }}>
                                                                {{ $tipo->nome }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Data -->
                                                <div class="col-md-3">
                                                    <input type="date"
                                                        name="incorporacoes[{{ $i }}][data_incorporacao]"
                                                        class="form-control"
                                                        value="{{ old("incorporacoes.$i.data_incorporacao", $inc->data_incorporacao) }}">
                                                </div>

                                                <!-- Local -->
                                                <div class="col-md-4">
                                                    <select name="incorporacoes[{{ $i }}][local]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($provincias as $provincia)
                                                            <option value="{{ $provincia->idprovincia }}"
                                                                {{ old("incorporacoes.$i.local", $inc->local) == $provincia->idprovincia ? 'selected' : '' }}>
                                                                {{ $provincia->provincia }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Botão remover -->
                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-incorporacao w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <!-- Caso não haja nenhuma incorporação -->
                                            <div class="incorporacao-entry row g-3 align-items-end mb-2">
                                                <div class="col-md-4">
                                                    <select name="incorporacoes[0][id_tipo_incorporacao]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipo_Incorporacao as $tipo)
                                                            <option value="{{ $tipo->id_tipo }}">{{ $tipo->nome }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <input type="date" name="incorporacoes[0][data_incorporacao]"
                                                        class="form-control">
                                                </div>

                                                <div class="col-md-4">
                                                    <select name="incorporacoes[0][local]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($provincias as $provincia)
                                                            <option value="{{ $provincia->idprovincia }}">
                                                                {{ $provincia->provincia }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-incorporacao w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="mt-3">
                                        <button type="button" id="addIncorporacao" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Incorporação
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Aba: Histórico -->
                        <div class="tab-pane fade" id="historico" role="tabpanel" aria-labelledby="historico-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-chevron-up me-2"></i>Progressão</h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Registre ou edite as progressões do especialista (posto ou cargo, conforme o tipo de
                                        ordem).
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="historico-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-3">Tipo de Ordem <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-3">Ordem <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Posto <span class="text-secondary">*</span></div>
                                            <div class="col-md-3">Cargo <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas existentes -->
                                        @forelse ($specialist->historicos as $i => $hist)
                                            <div class="historico-posto-entry row g-2 align-items-center mb-2">
                                                <!-- Tipo Ordem -->
                                                <div class="col-md-3">
                                                    <select name="tipo_ordem[{{ $i }}]"
                                                        class="form-select tipo-ordem">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipo_ordem as $tipo)
                                                            <option value="{{ $tipo->CodTipoOrdem }}"
                                                                {{ old("tipo_ordem.$i", $hist->id_tipo_ordem) == $tipo->CodTipoOrdem ? 'selected' : '' }}>
                                                                {{ $tipo->Descricao_tipo_ordem }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Ordem -->
                                                <div class="col-md-3">
                                                    <select name="ordem[{{ $i }}]" class="form-select ordem"
                                                        data-selected="{{ old("ordem.$i", $hist->id_ordem) }}">
                                                        <option value="">Carregando...</option>
                                                    </select>
                                                </div>

                                                <!-- Posto -->
                                                <div class="col-md-2">
                                                    <select name="posto[{{ $i }}]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($postos as $posto)
                                                            <option value="{{ $posto->Posto_Id }}"
                                                                {{ old("posto.$i", $hist->id_posto) == $posto->Posto_Id ? 'selected' : '' }}>
                                                                {{ $posto->PostoAbrev }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Cargo -->
                                                <div class="col-md-3">
                                                    <input type="text"
                                                        name="cargo_por_normalizar[{{ $i }}]"
                                                        class="form-control"
                                                        value="{{ old("cargo_por_normalizar.$i", $hist->cargo) }}"
                                                        placeholder="Cargo">
                                                </div>

                                                <!-- Ações -->
                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-historico w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <!-- Caso não haja progressões -->
                                            <div class="historico-posto-entry row g-2 align-items-center mb-2">
                                                <div class="col-md-3">
                                                    <select name="tipo_ordem[0]" class="form-select tipo-ordem">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipo_ordem as $tipo)
                                                            <option value="{{ $tipo->CodTipoOrdem }}">
                                                                {{ $tipo->Descricao_tipo_ordem }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <select name="ordem[0]" class="form-select ordem">
                                                        <option value="">Selecione o tipo primeiro</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-2">
                                                    <select name="posto[0]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($postos as $posto)
                                                            <option value="{{ $posto->Posto_Id }}">
                                                                {{ $posto->PostoAbrev }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <input type="text" name="cargo_por_normalizar[0]"
                                                        class="form-control" placeholder="Cargo">
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-historico w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->

                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <button type="button" id="addHistorico" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Progressão
                                        </button>

                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modalCadastrarOrdem">
                                            <i class="fas fa-plus-circle me-1"></i> Cadastrar Nova Ordem
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Aba: Formação -->
                        <div class="tab-pane fade" id="formacao" role="tabpanel" aria-labelledby="formacao-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-graduation-cap me-2"></i>Formações Académicas
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adicione ou edite todas as formações acadêmicas do especialista.
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="formacao-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-3">Instituição <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-3">Curso <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Data Início <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2">Data Fim <span class="text-secondary">*</span></div>
                                            <div class="col-md-1">Nota <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->formacoes as $i => $form)
                                            <div class="formacao-entry row g-2 align-items-center mb-2">
                                                <!-- Instituição -->
                                                <div class="col-md-3">
                                                    <select name="formacao_instituicao[{{ $i }}]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($instituicoes as $instituicao)
                                                            <option value="{{ $instituicao->id_instituicao }}"
                                                                {{ old("formacao_instituicao.$i", $form->id_instituicao) == $instituicao->id_instituicao ? 'selected' : '' }}>
                                                                {{ $instituicao->nome_instituicao }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Curso -->
                                                <div class="col-md-3">
                                                    <select name="id_curso[{{ $i }}]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($cursos as $curso)
                                                            <option value="{{ $curso->id_curso }}"
                                                                {{ old("id_curso.$i", $form->id_curso) == $curso->id_curso ? 'selected' : '' }}>
                                                                {{ $curso->nome_curso }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Data Início -->
                                                <div class="col-md-2">
                                                    <input type="date" name="formacao_inicio[{{ $i }}]"
                                                        class="form-control"
                                                        value="{{ old("formacao_inicio.$i", $form->data_inicio) }}">
                                                </div>

                                                <!-- Data Fim -->
                                                <div class="col-md-2">
                                                    <input type="date" name="formacao_fim[{{ $i }}]"
                                                        class="form-control"
                                                        value="{{ old("formacao_fim.$i", $form->data_fim) }}">
                                                </div>

                                                <!-- Nota -->
                                                <div class="col-md-1">
                                                    <input type="text" name="nota[{{ $i }}]"
                                                        class="form-control" value="{{ old("nota.$i", $form->nota) }}">
                                                </div>

                                                <!-- Ações -->
                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-formacao w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <!-- Primeira linha padrão -->
                                            <div class="formacao-entry row g-2 align-items-center mb-2">
                                                <div class="col-md-3">
                                                    <select name="formacao_instituicao[0]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($instituicoes as $instituicao)
                                                            <option value="{{ $instituicao->id_instituicao }}">
                                                                {{ $instituicao->nome_instituicao }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <select name="id_curso[0]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($cursos as $curso)
                                                            <option value="{{ $curso->id_curso }}">
                                                                {{ $curso->nome_curso }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-2">
                                                    <input type="date" name="formacao_inicio[0]" class="form-control">
                                                </div>

                                                <div class="col-md-2">
                                                    <input type="date" name="formacao_fim[0]" class="form-control">
                                                </div>

                                                <div class="col-md-1">
                                                    <input type="text" name="nota[0]" class="form-control">
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-formacao w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <button type="button" id="addFormacao" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Formação
                                        </button>
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modalCadastrarCurso">
                                            <i class="fas fa-plus-circle me-1"></i> Cadastrar Novo Curso
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <!-- Aba: Documentação -->
                        <div class="tab-pane fade" id="documentacao" role="tabpanel" aria-labelledby="documentacao-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-file-alt me-2"></i>Documentação</h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adiccione ou edite todos os documentos do especialista.
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="documentos-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-4">Tipo de Documento <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-3">Número <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Emissão <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Validade <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->documentos as $i => $documento)
                                            <div class="documento-entry row g-2 align-items-center mb-2">
                                                <!-- Tipo de Documento -->
                                                <div class="col-md-4">
                                                    <select name="documentos[{{ $i }}][id_tipo_doc]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tiposDocumento as $tipo)
                                                            <option value="{{ $tipo->id_tipo_doc }}"
                                                                {{ old("documentos.$i.id_tipo_doc", $documento->id_tipo_doc) == $tipo->id_tipo_doc ? 'selected' : '' }}>
                                                                {{ $tipo->nome_doc }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Número -->
                                                <div class="col-md-3">
                                                    <input type="text"
                                                        name="documentos[{{ $i }}][numero_doc]"
                                                        class="form-control"
                                                        value="{{ old("documentos.$i.numero_doc", $documento->numero_doc) }}">
                                                </div>

                                                <!-- Emissão -->
                                                <div class="col-md-2">
                                                    <input type="date"
                                                        name="documentos[{{ $i }}][data_emissao]"
                                                        class="form-control"
                                                        value="{{ old("documentos.$i.data_emissao", $documento->data_emissao) }}">
                                                </div>

                                                <!-- Validade -->
                                                <div class="col-md-2">
                                                    <input type="date"
                                                        name="documentos[{{ $i }}][data_validade]"
                                                        class="form-control"
                                                        value="{{ old("documentos.$i.data_validade", $documento->data_validade) }}">
                                                </div>

                                                <!-- Ações -->
                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-documento w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <!-- Linha padrão -->
                                            <div class="documento-entry row g-2 align-items-center mb-2">
                                                <div class="col-md-4">
                                                    <select name="documentos[0][id_tipo_doc]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tiposDocumento as $tipo)
                                                            <option value="{{ $tipo->id_tipo_doc }}">
                                                                {{ $tipo->nome_doc }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <input type="text" name="documentos[0][numero_doc]"
                                                        class="form-control">
                                                </div>

                                                <div class="col-md-2">
                                                    <input type="date" name="documentos[0][data_emissao]"
                                                        class="form-control">
                                                </div>

                                                <div class="col-md-2">
                                                    <input type="date" name="documentos[0][data_validade]"
                                                        class="form-control">
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-documento w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="mt-3">
                                        <button type="button" id="addDocumento" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Documento
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Aba: Contactos -->
                        <div class="tab-pane fade" id="contactos" role="tabpanel" aria-labelledby="contactos-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-address-book me-2"></i>Contactos</h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adicione ou edite todos os contactos do especialista.
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="contactos-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-5">Tipo de Contacto <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-6">Contacto <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->contactos as $i => $contacto)
                                            <div class="contacto-entry row g-3 mb-2 align-items-center">
                                                <div class="col-md-5">
                                                    <select name="contactos[{{ $i }}][tipo_contacto]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tiposContacto as $tipo)
                                                            <option value="{{ $tipo->idTipoContactos }}"
                                                                {{ old("contactos.$i.tipo_contacto", $contacto->tipo_contacto) == $tipo->idTipoContactos ? 'selected' : '' }}>
                                                                {{ $tipo->tipoContacto }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-6">
                                                    <input type="text"
                                                        name="contactos[{{ $i }}][contacto]"
                                                        class="form-control"
                                                        value="{{ old("contactos.$i.contacto", $contacto->Contacto) }}">
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-contacto w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="contacto-entry row g-3 mb-2 align-items-center">
                                                <div class="col-md-5">
                                                    <select name="contactos[0][tipo_contacto]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tiposContacto as $tipo)
                                                            <option value="{{ $tipo->idTipoContactos }}">
                                                                {{ $tipo->tipoContacto }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-6">
                                                    <input type="text" name="contactos[0][contacto]"
                                                        class="form-control">
                                                </div>

                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-contacto w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="mt-3">
                                        <button type="button" id="addContacto" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Contacto
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--Aba: Linguas -->
                        <div class="tab-pane fade" id="linguas" role="tabpanel" aria-labelledby="linguas-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-globe me-2"></i>Línguas Faladas</h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adicione ou edite todas as línguas faladas pelo especialista.
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="linguas-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-4">Tipo de Língua <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-4">Língua <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->linguasFaladas ?? [] as $i => $lingua)
                                            <div class="lingua-entry card p-3 mb-3 border-light">
                                                <div class="row g-3 align-items-center">
                                                    <div class="col-md-4">
                                                        <select name="linguas[{{ $i }}][id_grupo_lingua]"
                                                            class="form-select tipo-lingua">
                                                            <option value="">Seleccione</option>
                                                            @foreach ($tipoLinguas as $tipo)
                                                                <option value="{{ $tipo->id_grupo_lingua }}"
                                                                    {{ old("linguas.$i.id_grupo_lingua", $lingua->grupoLingua ?? '') == $tipo->id_grupo_lingua ? 'selected' : '' }}>
                                                                    {{ $tipo->descricao }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <select name="linguas[{{ $i }}][idLingua]"
                                                            class="form-select lingua">
                                                            <option value="">Seleccione</option>
                                                            @if (!empty($linguasPorGrupo[$lingua->grupoLingua] ?? []))
                                                                @foreach ($linguasPorGrupo[$lingua->grupoLingua] as $ling)
                                                                    <option value="{{ $ling->idLingua }}"
                                                                        {{ old("linguas.$i.idLingua", $lingua->idLingua ?? '') == $ling->idLingua ? 'selected' : '' }}>
                                                                        {{ $ling->descricaoLingua }}
                                                                    </option>
                                                                @endforeach
                                                            @endif
                                                        </select>
                                                    </div>

                                                    <div class="col-md-1 text-center">
                                                        <button type="button"
                                                            class="btn btn-danger btn-remove-lingua w-100">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="lingua-entry card p-3 mb-3 border-dark">
                                                <div class="row g-3 align-items-center">
                                                    <div class="col-md-4">
                                                        <select name="linguas[0][id_grupo_lingua]"
                                                            class="form-select tipo-lingua">
                                                            <option value="">Selecione</option>
                                                            @foreach ($tipoLinguas as $tipo)
                                                                <option value="{{ $tipo->id_grupo_lingua }}">
                                                                    {{ $tipo->descricao }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <select name="linguas[0][idLingua]" class="form-select lingua">
                                                            <option value="">Selecione o tipo primeiro</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-1 text-center">
                                                        <button type="button"
                                                            class="btn btn-danger btn-remove-lingua w-100" disabled>
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="mt-3">
                                        <button type="button" id="addLingua" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Língua Falada
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Aba: Família -->
                        <div class="tab-pane fade" id="agregado-familiar" role="tabpanel"
                            aria-labelledby="agregado-familiar-tab">
                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-users me-2"></i>Agregado Familiar</h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adicione ou edite os membros do agregado familiar.
                                    </div>

                                    <!-- Container com rolagem -->
                                    <div id="agregado-familiar-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-3">Nome do Membro <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2">Data de Nascimento <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2">Parentesco <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Sexo <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Naturalidade <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->agregados as $i => $membro)
                                            <div class="agregado-familiar-entry card p-3 mb-3 border-dark">
                                                <div class="row g-3 align-items-center">
                                                    <div class="col-md-3">
                                                        <input type="text"
                                                            name="agregado[{{ $i }}][Nome_Agr]"
                                                            class="form-control"
                                                            value="{{ old("agregado.$i.Nome_Agr", $membro->Nome_Agr) }}"
                                                            placeholder="Nome completo">
                                                    </div>

                                                    <div class="col-md-2">
                                                        <input type="date"
                                                            name="agregado[{{ $i }}][Data_Nasc_Agr]"
                                                            class="form-control"
                                                            value="{{ old("agregado.$i.Data_Nasc_Agr", $membro->Data_Nasc_Agr) }}">
                                                    </div>

                                                    <div class="col-md-2">
                                                        <select name="agregado[{{ $i }}][idGrauParentesco]"
                                                            class="form-select">
                                                            <option value="">Selecione</option>
                                                            @foreach ($grausParentesco as $grau)
                                                                <option value="{{ $grau->idGParentesco }}"
                                                                    {{ old("agregado.$i.idGrauParentesco", $membro->idGrauParentesco) == $grau->idGParentesco ? 'selected' : '' }}>
                                                                    {{ $grau->Parentesco }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-2">
                                                        <select name="agregado[{{ $i }}][Sexo_Agr]"
                                                            class="form-select">
                                                            <option value="">Selecione</option>
                                                            <option value="M"
                                                                {{ old("agregado.$i.Sexo_Agr", $membro->Sexo_Agr) == 'M' ? 'selected' : '' }}>
                                                                Masculino</option>
                                                            <option value="F"
                                                                {{ old("agregado.$i.Sexo_Agr", $membro->Sexo_Agr) == 'F' ? 'selected' : '' }}>
                                                                Feminino</option>
                                                        </select>
                                                    </div>

                                                    <div class="col-md-2">
                                                        <select name="agregado[{{ $i }}][Provincia_Agr]"
                                                            class="form-select">
                                                            <option value="">Selecione</option>
                                                            @foreach ($provincias as $provincia)
                                                                <option value="{{ $provincia->idprovincia }}"
                                                                    {{ old("agregado.$i.Provincia_Agr", $membro->Provincia) == $provincia->idprovincia ? 'selected' : '' }}>
                                                                    {{ $provincia->provincia }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>

                                                    <div class="col-md-1 text-center">
                                                        <button type="button"
                                                            class="btn btn-danger btn-remove-agregado w-100">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="agregado-familiar-entry card p-3 mb-3 border-dark">
                                                <div class="row g-3 align-items-center">
                                                    <div class="col-md-3">
                                                        <input type="text" name="agregado[0][Nome_Agr]"
                                                            class="form-control" placeholder="Nome completo">
                                                    </div>
                                                    <div class="col-md-2">
                                                        <input type="date" name="agregado[0][Data_Nasc_Agr]"
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-2">
                                                        <select name="agregado[0][idGrauParentesco]" class="form-select">
                                                            <option value="">Selecione</option>
                                                            @foreach ($grausParentesco as $grau)
                                                                <option value="{{ $grau->idGParentesco }}">
                                                                    {{ $grau->Parentesco }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="col-md-1">
                                                        <select name="agregado[0][Sexo_Agr]" class="form-select">
                                                            <option value="">Selecione</option>
                                                            <option value="M">Masculino</option>
                                                            <option value="F">Feminino</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <select name="agregado[0][Provincia_Agr]" class="form-select">
                                                            <option value="">Selecione</option>
                                                            @foreach ($provincias as $provincia)
                                                                <option value="{{ $provincia->idprovincia }}">
                                                                    {{ $provincia->provincia }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="col-md-1 text-center">
                                                        <button type="button"
                                                            class="btn btn-danger btn-remove-agregado w-100" disabled>
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforelse
                                    </div>

                                    <div class="mt-3">
                                        <button type="button" id="addAgregado" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Membro
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Aba: Foto -->
                        <div class="tab-pane fade" id="foto" role="tabpanel" aria-labelledby="foto-tab">
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle me-2"></i>Carregue ou substitua a foto do
                                especialista
                            </div>

                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="foto_militar" class="form-label">Foto <span
                                            class="text-secondary">*</span></label>
                                    <input type="file" name="foto_militar" id="foto_militar" class="form-control"
                                        accept="image/jpeg,image/png">
                                    <div class="card border-dark mt-3">
                                        <div class="card-header bg-dark text-white">
                                            <i class="fas fa-info-circle me-2"></i>Requisitos da Foto
                                        </div>
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Formato: JPG
                                                    ou
                                                    PNG</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Tamanho
                                                    máximo:
                                                    2MB</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Fundo branco
                                                    ou
                                                    neutro</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Rosto visível
                                                    e
                                                    centralizado</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Sem
                                                    acessórios
                                                    (óculos escuros, bonés)</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 text-center">
                                    <label class="form-label d-block">Pré-visualização actual</label>
                                    <img id="fotoPreview"
                                        src="{{ $specialist->fotos->first()->foto_militar ?? null ? asset('storage/' . $specialist->fotos->first()->foto_militar) : asset('images/default-profile.png') }}"
                                        alt="Foto atual" class="img-thumbnail"
                                        style="max-width: 250px; max-height: 250px;">
                                </div>


                            </div>
                        </div>
                    </div> <!-- Fecha tab-content -->

                    <div class="mt-4 pt-3 border-top d-flex justify-content-between align-items-center">
                        <small class="text-muted"><span class="text-danger">*</span> Campos obrigatórios</small>
                        <div>
                            <button type="submit" class="btn btn-warning px-4">
                                <i class="fas fa-save me-2"></i> Actualizar Dados
                            </button>
                            <a href="{{ route('specialist.index') }}" class="btn btn-secondary px-4">
                                <i class="fas fa-times me-2"></i> Cancelar
                            </a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!-- Modal de Cadastro de Ordem -->
    <div class="modal fade" id="modalCadastrarOrdem" tabindex="-1" aria-labelledby="modalCadastrarOrdemLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-dark">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="modalCadastrarOrdemLabel">
                        <i class="fas fa-plus-circle me-2"></i> Cadastrar Nova Ordem
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <form id="formCadastrarOrdem" method="POST" action="{{ route('store.order') }}">
                        @csrf
                        <div class="row g-3">

                            <!-- Tipo de Ordem -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-tags me-1"></i> Tipo <span
                                        class="text-danger">*</span></label>
                                <select name="idTipoOrdem" class="form-select" required>
                                    <option value="">Selecione...</option>
                                    @foreach ($tiposOrdem as $tipo)
                                        <option value="{{ $tipo->CodTipoOrdem }}">{{ $tipo->Descricao_tipo_ordem }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Número da Ordem -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-hashtag me-1"></i> Número <span
                                        class="text-danger">*</span></label>
                                <input type="number" name="N_ORDEM" class="form-control" required>
                            </div>

                            <!-- Data -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-calendar-day me-1"></i> Data <span
                                        class="text-danger">*</span></label>
                                <input type="date" name="DATA_ORDEM" class="form-control" required>
                            </div>

                            <!-- Entidade -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-building me-1"></i> Entidade <span
                                        class="text-danger">*</span></label>
                                <select name="idEntidade" class="form-select" required>
                                    <option value="">Selecione...</option>
                                    @foreach ($entidades as $entidade)
                                        <option value="{{ $entidade->id_entidade }}">{{ $entidade->Entidade_Abrev }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="mt-4 d-flex justify-content-end">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save me-1"></i> Salvar Ordem
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Cadastro de Curso -->
    <div class="modal fade" id="modalCadastrarCurso" tabindex="-1" aria-labelledby="modalCadastrarCursoLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-3">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="modalCadastrarCursoLabel">
                        <i class="fas fa-graduation-cap me-2"></i> Cadastrar Novo Curso
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Fechar"></button>
                </div>

                <div class="modal-body p-4">
                    <form id="formCadastrarCurso" method="POST" action="{{ route('store.course') }}">
                        @csrf

                        <div class="row g-3 mb-3">
                            <!-- Nome -->
                            <div class="col-md-6">
                                <label class="form-label fw-bold">
                                    <i class="fas fa-book me-1 text-dark"></i> Nome do Curso <span
                                        class="text-danger">*</span>
                                </label>
                                <input type="text" name="nome_curso" class="form-control"
                                    placeholder="Ex: Engenharia Informática" required>
                            </div>

                            <!-- Nível -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold">
                                    <i class="fas fa-layer-group me-1 text-dark"></i> Nível <span
                                        class="text-danger">*</span>
                                </label>
                                <select name="id_nivel_curso" class="form-select" required>
                                    <option value="">Selecione...</option>
                                    @foreach ($niveis as $nivel)
                                        <option value="{{ $nivel->id_nivel_curso }}">{{ $nivel->nive_curso }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Tipo -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold">
                                    <i class="fas fa-tags me-1 text-dark"></i> Tipo de Curso <span
                                        class="text-danger">*</span>
                                </label>
                                <select name="id_tipo_curso" class="form-select" required>
                                    <option value="">Selecione...</option>
                                    @foreach ($tipo_curso as $tipo)
                                        <option value="{{ $tipo->id_tipo_curso }}">{{ $tipo->tipo_curso }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save me-1"></i> Salvar Curso
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
