@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex justify-content-between align-items-start mb-4">
            <div>
                <h2 class="h3 mb-0 text-gray-800"><i class="fas fa-user-plus text-dark me-2"></i>Cadastrar Especialista</h2>
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
                    <li class="breadcrumb-item active text-dark">Cadastrar</li>
                </ol>
            </nav>
        </div>

        <div class="card shadow mb-4 border-0">
            <div class="card-header bg-nav text-white py-3">
                <h5 class="mb-0"><i class="fas fa-user-edit me-2"></i> Formulário de Cadastro</h5>
            </div>
            <div class="card-body">
                <form action="{{ route('specialist.store') }}" method="POST" enctype="multipart/form-data"
                    id="specialistForm">
                    @csrf

                    <!-- Abas de navegação melhoradas -->
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
                                <i class="fas fa-language me-1"></i> Linguas Faladas
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="agregado-familiar-tab" data-bs-toggle="tab"
                                data-bs-target="#agregado-familiar" type="button" role="tab"
                                aria-controls="agregado-familiar" aria-selected="false">
                                <i class="fas fa-users me-1"></i> Agregado Familiar
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="foto-tab" data-bs-toggle="tab" data-bs-target="#foto"
                                type="button" role="tab" aria-controls="foto" aria-selected="false">
                                <i class="fas fa-camera me-1"></i> Foto
                            </button>
                        </li>
                    </ul>

                    <x-alert />

                    <div class="tab-content p-3 border border-top-0 rounded-bottom" id="specialistTabContent">
                        <!-- Dados Pessoais -->
                        <div class="tab-pane fade show active" id="dados-pessoais" role="tabpanel"
                            aria-labelledby="dados-pessoais-tab">
                            <div class="row g-3">

                                <div class="col-md-6">
                                    <label for="nome" class="form-label">
                                        <i class="fas fa-user me-1 text-dark"></i> Nome <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="nome" id="nome" class="form-control"
                                        value="{{ old('nome') }}" placeholder="Nome completo">
                                </div>

                                <div class="col-md-3">
                                    <label for="alcunha" class="form-label">
                                        <i class="fas fa-id-card-alt me-1 text-dark"></i> Alcunha <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="alcunha" id="alcunha" class="form-control"
                                        value="{{ old('alcunha') }}" placeholder="Alcunha">
                                </div>

                                <div class="col-md-3">
                                    <label for="data_nascimento" class="form-label">
                                        <i class="fas fa-birthday-cake me-1 text-dark"></i> Data de Nascimento <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="date" name="data_nascimento" id="data_nascimento"
                                        class="form-control" value="{{ old('data_nascimento') }}">
                                </div>

                                <div class="col-md-3">
                                    <label for="id_sexo" class="form-label">
                                        <i class="fas fa-venus-mars me-1 text-dark"></i> Sexo <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="id_sexo" id="id_sexo" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($sexos as $sexo)
                                            <option value="{{ $sexo->id_sexo }}"
                                                {{ old('id_sexo') == $sexo->id_sexo ? 'selected' : '' }}>
                                                {{ $sexo->id_sexo }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="id_estado_civil" class="form-label">
                                        <i class="fas fa-ring me-1 text-dark"></i> Estado Civil <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="id_estado_civil" id="id_estado_civil" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($estadosCivis as $estado)
                                            <option value="{{ $estado->id_estado_civil }}"
                                                {{ old('id_estado_civil') == $estado->id_estado_civil ? 'selected' : '' }}>
                                                {{ $estado->estado_civil }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="id_provincia" class="form-label">
                                        <i class="fas fa-globe-africa me-1 text-dark"></i>Nascimento <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="id_provincia" id="id_provincia" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($provincias as $provincia)
                                            <option value="{{ $provincia->idprovincia }}"
                                                {{ old('id_provincia') == $provincia->idprovincia ? 'selected' : '' }}>
                                                {{ $provincia->provincia }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="idmunicipio" class="form-label">
                                        <i class="fas fa-map-marker-alt me-1 text-dark"></i> Município <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="idmunicipio" id="idmunicipio" class="form-select">
                                        <option value="">Selecione o Município</option>
                                        @if (old('idmunicipio'))
                                            <option value="{{ old('idmunicipio') }}" selected>{{ old('idmunicipio') }}
                                            </option>
                                        @endif
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="nome_pai" class="form-label">
                                        <i class="fas fa-male me-1 text-dark"></i> Nome do Pai <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="nome_pai" id="nome_pai" class="form-control"
                                        value="{{ old('nome_pai') }}" placeholder="Nome do Pai">
                                </div>

                                <div class="col-md-3">
                                    <label for="nome_mae" class="form-label">
                                        <i class="fas fa-female me-1 text-dark"></i> Nome da Mãe <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="nome_mae" id="nome_mae" class="form-control"
                                        value="{{ old('nome_mae') }}" placeholder="Nome da Mãe">
                                </div>

                                <div class="col-md-3">
                                    <label for="grupo_sanguineo" class="form-label">
                                        <i class="fas fa-tint me-1 text-dark"></i> Grupo Sanguíneo <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="grupo_sanguineo" id="grupo_sanguineo" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($grupoSanguineo as $grupo)
                                            <option value="{{ $grupo->idGSangue }}"
                                                {{ old('grupo_sanguineo') == $grupo->idGSangue ? 'selected' : '' }}>
                                                {{ $grupo->Tipo_Sanguinio }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="altura" class="form-label">
                                        <i class="fas fa-ruler-vertical me-1 text-dark"></i> Altura (m) <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="number" step="0.01" min="0" max="3" name="altura"
                                        id="altura" class="form-control" value="{{ old('altura') }}"
                                        placeholder="Ex: 1.75">
                                </div>

                                <div class="col-md-3">
                                    <label for="habilitacao_id" class="form-label">
                                        <i class="fas fa-graduation-cap me-1 text-dark"></i> Habilitação Literária <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="habilitacao_id" id="habilitacao_id" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($habilitacoes as $habilitacao)
                                            <option value="{{ $habilitacao->habilitacao_id }}"
                                                {{ old('habilitacao_id') == $habilitacao->habilitacao_id ? 'selected' : '' }}>
                                                {{ $habilitacao->descricao }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="Nro_Calcado" class="form-label">
                                        <i class="fas fa-shoe-prints me-1 text-dark"></i> Nº de Calçado <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="Nro_Calcado" id="Nro_Calcado" class="form-control"
                                        value="{{ old('Nro_Calcado') }}" placeholder="Ex: 42">
                                </div>

                                <div class="col-md-3">
                                    <label for="Nro_Camisa" class="form-label">
                                        <i class="fas fa-tshirt me-1 text-dark"></i> Nº de Camisa <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="Nro_Camisa" id="Nro_Camisa" class="form-control"
                                        value="{{ old('Nro_Camisa') }}" placeholder="Ex: M">
                                </div>

                                <div class="col-md-3">
                                    <label for="Nro_Calca" class="form-label">
                                        <i class="fas fa-user-tie me-1 text-dark"></i> Nº de Calça <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <input type="text" name="Nro_Calca" id="Nro_Calca" class="form-control"
                                        value="{{ old('Nro_Calca') }}" placeholder="Ex: 40">
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
                                        value="{{ old('endereco') }}">
                                </div>
                            </div>
                        </div>


                        <!-- Dados Militares -->
                        <div class="tab-pane fade" id="dados-militares" role="tabpanel"
                            aria-labelledby="dados-militares-tab">
                            <div class="row g-3 mb-3">
                                <div class="col-md-4">
                                    <label for="nip" class="form-label">
                                        <i class="fas fa-id-badge me-1 text-dark"></i> NIP <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="nip" id="nip" class="form-control"
                                        placeholder="NIP" value="{{ old('nip') }}">
                                </div>
                                <div class="col-md-4">
                                    <label for="id_posto_organico" class="form-label">
                                        <i class="fas fa-flag me-1 text-dark"></i> Posto <span
                                            class="text-danger">*</span>
                                    </label>
                                    <select name="id_posto_organico" id="id_posto_organico" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($postos as $posto)
                                            <option value="{{ $posto->Posto_Id }}"
                                                {{ old('id_posto_organico') == $posto->Posto_Id ? 'selected' : '' }}>
                                                {{ $posto->Posto }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="quadro_especial" class="form-label">
                                        <i class="fas fa-layer-group me-1 text-dark"></i> Quadro Especial <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="quadro_especial" id="quadro_especial" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($quadroEspecial as $item)
                                            <option value="{{ $item->Classe_Id }}">
                                                {{ old('quadro_especial') == $item->Classe_Id ? 'selected' : '' }}
                                                {{ $item->Classe }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="especialidade" class="form-label">
                                        <i class="fas fa-certificate me-1 text-dark"></i> Especialidade <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="especialidade" id="especialidade" class="form-select">
                                        <option value="">Selecione</option>
                                        
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="FPS" class="form-label">
                                        <i class="fas fa-clipboard-check me-1 text-dark"></i> FPS <span
                                            class="text-secondary">*</span>
                                    </label>
                                    <select name="FPS" id="FPS" class="form-select">
                                        <option value="">Selecione</option>
                                        @foreach ($fps as $fp)
                                            <option value="{{ $fp->Sitq_Id }}"
                                                {{ old('FPS') == $fp->Sitq_Id ? 'selected' : '' }}>
                                                {{ $fp->Situacao_Quadro }}</option>
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
                                                {{ old('id_situacao') == $item->id_situacao ? 'selected' : '' }}>
                                                {{ $item->nome_situacao }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="id_condicao" class="form-label">Condição Militar <span
                                            class="text-secondary">*</span></label>
                                    <select name="id_condicao" id="id_condicao" class="form-select">
                                        <option value="">Selecione uma situação primeiro</option>
                                        @if (old('id_condicao'))
                                            <option value="{{ old('id_condicao') }}" selected>{{ old('id_condicao') }}
                                            </option>
                                        @endif
                                    </select>
                                </div>                        

                                <!-- Incorporações -->
                                <div class="card mb-4">
                                    <div class="card-header bg-light text-dark">
                                        <h5 class="mb-0"><i class="fas fa-calendar-plus me-2"></i>Incorporações</h5>
                                    </div>

                                    <div class="card-body">
                                        <div class="alert alert-info mb-4">
                                            <i class="fas fa-info-circle me-2"></i>
                                            Registre as incorporações do especialista (tipo, data e local).
                                        </div>

                                        <!-- Container com rolagem -->
                                        <div id="incorporacoes-container" class="scrollable-container"
                                            style="max-height: 400px; overflow-y: auto;">

                                            <!-- Cabeçalho fixo -->
                                            <div
                                                class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                                <div class="col-md-4">Tipo de Incorporação <span
                                                        class="text-secondary">*</span></div>
                                                <div class="col-md-3">Data <span class="text-danger">*</span></div>
                                                <div class="col-md-4">Local <span class="text-secondary">*</span></div>
                                                <div class="col-md-1 text-center">Acções</div>
                                            </div>

                                            <!-- Primeira linha padrão -->
                                            <div class="incorporacao-entry row g-3 align-items-end mb-2">
                                                <!-- Tipo de Incorporação -->
                                                <div class="col-md-4">
                                                    <select name="incorporacoes[0][id_tipo_incorporacao]"
                                                        class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipo_Incorporacao as $tipo)
                                                            <option value="{{ $tipo->id_tipo }}"
                                                                {{ old('incorporacoes.0.id_tipo_incorporacao') == $tipo->id_tipo ? 'selected' : '' }}>
                                                                {{ $tipo->nome }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Data -->
                                                <div class="col-md-3">
                                                    <input type="date" name="incorporacoes[0][data_incorporacao]"
                                                        class="form-control"
                                                        value="{{ old('incorporacoes.0.data_incorporacao') }}">
                                                </div>

                                                <!-- Local -->
                                                <div class="col-md-4">
                                                    <select name="incorporacoes[0][local]" class="form-select">
                                                        <option value="">Selecione</option>
                                                        @foreach ($provincias as $provincia)
                                                            <option value="{{ $provincia->idprovincia }}"
                                                                {{ old('incorporacoes.0.local') == $provincia->idprovincia ? 'selected' : '' }}>
                                                                {{ $provincia->provincia }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Botão remover -->
                                                <div class="col-md-1 text-center">
                                                    <button type="button"
                                                        class="btn btn-danger btn-remove-incorporacao w-100" disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
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
                        </div>


                        <!-- Histórico -->
                        <div class="tab-pane fade" id="historico" role="tabpanel" aria-labelledby="historico-tab">
                            <div class="card mb-4">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0">
                                        <i class="fas fa-chevron-up me-2"></i>Histórico de Progressão
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Registre a progressão do especialista (posto ou cargo, conforme o tipo de ordem).
                                    </div>                                 

                                    <!-- Container com scroll -->
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

                                        <!-- Primeira linha padrão -->
                                        <div class="historico-posto-entry row g-3 align-items-end mb-2">
                                            <!-- Tipo Ordem -->
                                            <div class="col-md-3">
                                                <select name="tipo_ordem[0]" class="form-select tipo-ordem" >
                                                    <option value="">Selecione</option>
                                                    @foreach ($tipo_ordem as $tipo)
                                                        <option value="{{ $tipo->CodTipoOrdem }}">
                                                            {{ $tipo->Descricao_tipo_ordem }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Ordem -->
                                            <div class="col-md-3">
                                                <select name="ordem[0]" class="form-select ordem" data-selected="">
                                                    <option value="">Selecione o tipo primeiro</option>
                                                </select>
                                            </div>

                                            <!-- Posto -->
                                            <div class="col-md-2">
                                                <select name="posto[0]" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($postos as $posto)
                                                        <option value="{{ $posto->Posto_Id }}">{{ $posto->PostoAbrev }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Cargo -->
                                            <div class="col-md-3">
                                                <input type="text" name="cargo_por_normalizar[0]" class="form-control"
                                                    placeholder="Cargo">
                                            </div>

                                            <!-- Botão Remover -->
                                            <div class="col-md-1 text-center">
                                                <button type="button" class="btn btn-danger btn-remove-historico w-100"
                                                    disabled>
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botão Adicionar -->

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



                        <!-- Formação -->
                        <div class="tab-pane fade" id="formacao" role="tabpanel" aria-labelledby="formacao-tab">
                            <div class="card mb-4">
                                <div class="card-header bg-light">
                                    <h5 class="mb-0">
                                        <i class="fas fa-user-graduate me-2"></i>Formação Académica
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <div class="alert alert-info mb-4">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Adicione todas as formações acadêmicas do especialista
                                    </div>
                                 
                                    <!-- Container geral -->
                                    <div id="formacao-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">
                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-3">Instituição <span class="text-secondary">*</span></div>
                                            <div class="col-md-3">Curso <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Data Início <span class="text-secondary">*</span></div>
                                            <div class="col-md-2">Data Fim <span class="text-secondary">*</span></div>
                                            <div class="col-md-1">Nota <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Primeira linha de formação -->
                                        <div class="formacao-entry row g-3 mb-2 align-items-end">
                                            <!-- Instituição -->
                                            <div class="col-md-3">
                                                <select name="formacao_instituicao[]" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($instituicoes as $instituicao)
                                                        <option value="{{ $instituicao->id_instituicao }}"
                                                            {{ collect(old('formacao_instituicao'))->contains($instituicao->id_instituicao) ? 'selected' : '' }}>
                                                            {{ $instituicao->nome_instituicao }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Curso -->
                                            <div class="col-md-3">
                                                <select name="id_curso[]" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($cursos as $curso)
                                                        <option value="{{ $curso->id_curso }}"
                                                            {{ collect(old('id_curso'))->contains($curso->id_curso) ? 'selected' : '' }}>
                                                            {{ $curso->nome_curso }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Data Início -->
                                            <div class="col-md-2">
                                                <input type="date" name="formacao_inicio[]" class="form-control"
                                                    value="{{ old('formacao_inicio.0') }}">
                                            </div>

                                            <!-- Data Fim -->
                                            <div class="col-md-2">
                                                <input type="date" name="formacao_fim[]" class="form-control"
                                                    value="{{ old('formacao_fim.0') }}">
                                            </div>

                                            <!-- Nota -->
                                            <div class="col-md-1">
                                                <input type="text" name="nota[]" class="form-control"
                                                    value="{{ old('nota.0') }}">
                                            </div>

                                            <!-- Botão Remover -->
                                            <div class="col-md-1 text-center">
                                                <button type="button" class="btn btn-danger btn-remove-formacao"
                                                    disabled>
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botão adicionar -->
                                      <div class="d-flex justify-content-between align-items-center mt-3">
                                        <button type="button" id="addFormacao" class="btn btn-dark">
                                            <i class="fas fa-plus-circle me-1"></i> Adiccionar Formação
                                        </button>
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#modalCadastrarCurso">
                                            <i class="fas fa-plus-circle me-1"></i> Cadastrar Novo Curso
                                        </button>
                                    </div>                                    
                                </div>
                            </div>
                        </div>


                        <!-- Documentação -->
                        <div class="tab-pane fade" id="documentacao" role="tabpanel" aria-labelledby="documentacao-tab">
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle me-2"></i>
                                Adicione todos os documentos oficiais do especialista.
                            </div>

                            <div class="card mb-4">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-folder-open me-2"></i>Documentação</h5>
                                </div>

                                <div class="card-body">
                                    <div id="documentos-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-4">
                                                <i class="fas fa-file-signature me-1 text-dark"></i> Tipo de Documento
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-3">
                                                <i class="fas fa-hashtag me-1 text-dark"></i> Número
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2">
                                                <i class="fas fa-calendar-day me-1 text-dark"></i> Emissão
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2">
                                                <i class="fas fa-calendar-times me-1 text-dark"></i> Validade
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-1 text-center">Acções</div>
                                        </div>

                                        <!-- Primeira linha padrão -->
                                        <div class="documento-entry row g-3 align-items-end mb-2">
                                            <!-- Tipo de Documento -->
                                            <div class="col-md-4">
                                                <select name="documentos[0][id_tipo_doc]" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($tiposDocumento as $tipo)
                                                        <option value="{{ $tipo->id_tipo_doc }}"
                                                            {{ old('documentos.0.id_tipo_doc') == $tipo->id_tipo_doc ? 'selected' : '' }}>
                                                            {{ $tipo->nome_doc }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Número -->
                                            <div class="col-md-3">
                                                <input type="text" name="documentos[0][numero_doc]"
                                                    class="form-control" placeholder="Número do documento"
                                                    value="{{ old('documentos.0.numero_doc') }}">
                                            </div>

                                            <!-- Data Emissão -->
                                            <div class="col-md-2">
                                                <input type="date" name="documentos[0][data_emissao]"
                                                    class="form-control" value="{{ old('documentos.0.data_emissao') }}">
                                            </div>

                                            <!-- Data Validade -->
                                            <div class="col-md-2">
                                                <input type="date" name="documentos[0][data_validade]"
                                                    class="form-control" value="{{ old('documentos.0.data_validade') }}">
                                            </div>

                                            <!-- Botão Remover -->
                                            <div class="col-md-1 text-center">
                                                <button type="button" class="btn btn-danger btn-remove-documento w-100"
                                                    disabled>
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </div>
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


                        <!-- Contactos -->
                        <div class="tab-pane fade" id="contactos" role="tabpanel" aria-labelledby="contactos-tab">
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle me-2"></i>
                                Adicione todos os contactos do especialista.
                            </div>

                            <div class="card mb-4">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-address-book me-2"></i>Contactos</h5>
                                </div>

                                <div class="card-body">
                                    <div id="contactos-container" class="scrollable-container"
                                        style="max-height: 400px; overflow-y: auto;">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-5">
                                                <i class="fas fa-phone-volume me-1 text-dark"></i> Tipo de Contacto
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-5">
                                                <i class="fas fa-mobile-alt me-1 text-dark"></i> Contacto
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2 text-center">Acções</div>
                                        </div>

                                        <!-- Primeira linha padrão -->
                                        <div class="contacto-entry row g-3 align-items-end mb-2">
                                            <!-- Tipo de Contacto -->
                                            <div class="col-md-5">
                                                <select name="contactos[0][tipo_contacto]" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($tiposContacto as $tipo)
                                                        <option value="{{ $tipo->idTipoContactos }}"
                                                            {{ old('contactos.0.tipo_contacto') == $tipo->idTipoContactos ? 'selected' : '' }}>
                                                            {{ $tipo->tipoContacto }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Contacto -->
                                            <div class="col-md-5">
                                                <input type="text" name="contactos[0][contacto]" class="form-control"
                                                    placeholder="Ex: +244 923 456 789"
                                                    value="{{ old('contactos.0.contacto') }}">
                                            </div>

                                            <!-- Botão Remover -->
                                            <div class="col-md-2 text-center">
                                                <button type="button" class="btn btn-danger btn-remove-contacto w-100"
                                                    disabled>
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </div>
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

                        <!-- Linguas -->
                        <div class="tab-pane fade" id="linguas" role="tabpanel" aria-labelledby="linguas-tab">
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle me-2"></i>
                                Adicione todas as línguas faladas pelo especialista.
                            </div>

                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-language me-2"></i>Línguas Faladas</h5>
                                </div>

                                <div class="card-body" style="max-height: 400px; overflow-y: auto; position: relative;">
                                    <div id="linguas-container" class="scrollable-container">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light">
                                            <div class="col-md-5">
                                                <i class="fas fa-globe me-1 text-dark"></i> Tipo de Língua
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-5">
                                                <i class="fas fa-flag me-1 text-dark"></i> Língua
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2 text-center">Acções</div>
                                        </div>

                                        <!-- Linhas dinâmicas -->
                                        @forelse ($specialist->linguasFaladas ?? [] as $i => $lingua)
                                            <div class="lingua-entry row g-3 align-items-end mb-2">
                                                <!-- Tipo de Língua -->
                                                <div class="col-md-5">
                                                    <select name="linguas[{{ $i }}][id_grupo_lingua]"
                                                        class="form-select tipo-lingua">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipoLinguas as $tipo)
                                                            <option value="{{ $tipo->id_grupo_lingua }}"
                                                                {{ old("linguas.$i.id_grupo_lingua", $lingua->grupoLingua ?? '') == $tipo->id_grupo_lingua ? 'selected' : '' }}>
                                                                {{ $tipo->descricao }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Língua -->
                                                <div class="col-md-5">
                                                    <select name="linguas[{{ $i }}][idLingua]"
                                                        class="form-select lingua">
                                                        @if (!empty($linguasPorGrupo[$lingua->grupoLingua] ?? []))
                                                            @foreach ($linguasPorGrupo[$lingua->grupoLingua] as $ling)
                                                                <option value="{{ $ling->idLingua }}"
                                                                    {{ old("linguas.$i.idLingua", $lingua->idLingua ?? '') == $ling->idLingua ? 'selected' : '' }}>
                                                                    {{ $ling->descricaoLingua }}
                                                                </option>
                                                            @endforeach
                                                        @else
                                                            <option value="">Selecione o tipo primeiro</option>
                                                        @endif
                                                    </select>
                                                </div>

                                                <!-- Botão remover -->
                                                <div class="col-md-2 text-center">
                                                    <button type="button" class="btn btn-danger btn-remove-lingua w-100">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        @empty
                                            <!-- Linha inicial -->
                                            <div class="lingua-entry row g-3 align-items-end mb-2">
                                                <div class="col-md-5">
                                                    <select name="linguas[0][id_grupo_lingua]"
                                                        class="form-select tipo-lingua">
                                                        <option value="">Selecione</option>
                                                        @foreach ($tipoLinguas as $tipo)
                                                            <option value="{{ $tipo->id_grupo_lingua }}">
                                                                {{ $tipo->descricao }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="col-md-5">
                                                    <select name="linguas[0][idLingua]" class="form-select lingua">
                                                        <option value="">Selecione o tipo primeiro</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <button type="button" class="btn btn-danger btn-remove-lingua w-100"
                                                        disabled>
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
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


                        <!-- Agregado Familiar -->
                        <div class="tab-pane fade" id="agregado-familiar" role="tabpanel"
                            aria-labelledby="agregado-familiar-tab">
                            <div class="alert alert-info mb-4">
                                <i class="fas fa-info-circle me-2"></i>
                                Adicione todos os membros do agregado familiar do especialista.
                            </div>

                            <div class="card mb-4 border-light">
                                <div class="card-header bg-light text-dark">
                                    <h5 class="mb-0"><i class="fas fa-users me-2"></i>Agregado Familiar</h5>
                                </div>

                                <div class="card-body" style="max-height: 400px; overflow-y: auto; position: relative;">
                                    <div id="agregado-familiar-container" class="scrollable-container">

                                        <!-- Cabeçalho fixo -->
                                        <div
                                            class="row fw-semibold border-bottom pb-2 mb-3 text-black sticky-header bg-light small">
                                            <div class="col-md-3"><i class="fas fa-user me-1 text-dark"></i> Nome <span
                                                    class="text-secondary">*</span></div>
                                            <div class="col-md-2"><i class="fas fa-birthday-cake me-1 text-dark"></i>
                                                Nascimento <span class="text-secondary">*</span></div>
                                            <div class="col-md-2"><i class="fas fa-users-cog me-1 text-dark"></i>
                                                Parentesco <span class="text-secondary">*</span></div>
                                            <div class="col-md-2"><i class="fas fa-venus-mars me-1 text-dark"></i> Sexo
                                                <span class="text-secondary">*</span>
                                            </div>
                                            <div class="col-md-2"><i class="fas fa-map-marker-alt me-1 text-dark"></i>
                                                Naturalidade <span class="text-secondary">*</span></div>
                                            <div class="col-md-1 text-center">Ação</div>
                                        </div>

                                        <!-- Linha -->
                                        <div class="agregado-familiar-entry row g-2 align-items-center mb-2">
                                            <!-- Nome -->
                                            <div class="col-md-3">
                                                <input type="text" name="agregado[0][Nome_Agr]"
                                                    class="form-control form-control-sm" placeholder="Nome completo"
                                                    value="{{ old('agregado.0.Nome_Agr') }}">
                                            </div>

                                            <!-- Data de Nascimento -->
                                            <div class="col-md-2">
                                                <input type="date" name="agregado[0][Data_Nasc_Agr]"
                                                    class="form-control form-control-sm"
                                                    value="{{ old('agregado.0.Data_Nasc_Agr') }}">
                                            </div>

                                            <!-- Parentesco -->
                                            <div class="col-md-2">
                                                <select name="agregado[0][idGrauParentesco]"
                                                    class="form-select form-select-sm">
                                                    <option value="">Selecione</option>
                                                    @foreach ($grausParentesco as $grau)
                                                        <option value="{{ $grau->idGParentesco }}"
                                                            {{ old('agregado.0.idGrauParentesco') == $grau->idGParentesco ? 'selected' : '' }}>
                                                            {{ $grau->Parentesco }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Sexo -->
                                            <div class="col-md-2">
                                                <select name="agregado[0][Sexo_Agr]" class="form-select form-select-sm">
                                                    <option value="">Selecione</option>
                                                    <option value="M"
                                                        {{ old('agregado.0.Sexo_Agr') == 'M' ? 'selected' : '' }}>M
                                                    </option>
                                                    <option value="F"
                                                        {{ old('agregado.0.Sexo_Agr') == 'F' ? 'selected' : '' }}>F
                                                    </option>
                                                </select>
                                            </div>

                                            <!-- Naturalidade -->
                                            <div class="col-md-2">
                                                <select name="agregado[0][Provincia_Agr]"
                                                    class="form-select form-select-sm">
                                                    <option value="">Selecione</option>
                                                    @foreach ($provincias as $provincia)
                                                        <option value="{{ $provincia->idprovincia }}"
                                                            {{ old('agregado.0.Provincia_Agr') == $provincia->idprovincia ? 'selected' : '' }}>
                                                            {{ $provincia->provincia }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Botão -->
                                            <div class="col-md-1 text-center">
                                                <button type="button"
                                                    class="btn btn-danger btn-sm btn-remove-agregado w-100" disabled>
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botão adicionar -->
                                    <div class="mt-3">
                                        <button type="button" id="addAgregado" class="btn btn-dark btn-sm">
                                            <i class="fas fa-plus-circle me-1"></i> Adicionar Membro
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Foto -->
                        <div class="tab-pane fade" id="foto" role="tabpanel" aria-labelledby="foto-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card border-dark">
                                        <div class="card-header bg-dark text-white">
                                            <i class="fas fa-camera me-2"></i>Foto Militar <span
                                                class="text-secondary">*</span>
                                        </div>
                                        <div class="card-body">
                                            <!-- Upload da Foto -->
                                            <div class="mb-3">
                                                <label for="foto_militar" class="form-label fw-bold">
                                                    <i class="fas fa-camera me-2 text-dark"></i> Foto Militar (JPG/PNG,
                                                    máx. 2MB)
                                                </label>
                                                <input type="file" name="foto_militar" id="foto_militar"
                                                    class="form-control @error('foto_militar') is-invalid @enderror"
                                                    accept="image/jpeg,image/png">

                                                @error('foto_militar')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>

                                            <!-- Pré-visualização -->
                                            <div class="text-center">
                                                <img id="fotoPreview"
                                                    src="{{ old('foto_militar')
                                                        ? asset('storage/fotos/' . old('foto_militar'))
                                                        : (isset($specialist->foto_militar)
                                                            ? asset('storage/' . $specialist->foto_militar)
                                                            : asset('images/default-profile.png')) }}"
                                                    alt="Pré-visualização da foto" class="img-thumbnail shadow-sm"
                                                    style="max-width: 200px; max-height: 200px; border-radius: 10px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card border-dark">
                                        <div class="card-header bg-dark text-white">
                                            <i class="fas fa-info-circle me-2"></i>Requisitos da Foto
                                        </div>
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Formato: JPG ou
                                                    PNG</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Tamanho máximo:
                                                    2MB</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Fundo branco ou
                                                    neutro</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Rosto visível e
                                                    centralizado</li>
                                                <li class="list-group-item"><i
                                                        class="fas fa-check-circle text-success me-2"></i>Sem acessórios
                                                    (óculos escuros, bonés)</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4 pt-3 border-top d-flex justify-content-between align-items-center">
                        <small class="text-muted"><span class="text-danger">*</span> Campos obrigatórios.</small>
                        <div>
                            <button type="submit" class="btn btn-success px-4">
                                <i class="fas fa-save me-2"></i> Cadastrar Especialista
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
                                <select name="idTipoOrdem" class="form-select">
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
                                <input type="number" name="N_ORDEM" class="form-control">
                            </div>

                            <!-- Data -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-calendar-day me-1"></i> Data <span
                                        class="text-danger">*</span></label>
                                <input type="date" name="DATA_ORDEM" class="form-control">
                            </div>

                            <!-- Entidade -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold"><i class="fas fa-building me-1"></i> Entidade <span
                                        class="text-danger">*</span></label>
                                <select name="idEntidade" class="form-select">
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
                                    placeholder="Ex: Engenharia Informática">
                            </div>

                            <!-- Nível -->
                            <div class="col-md-3">
                                <label class="form-label fw-bold">
                                    <i class="fas fa-layer-group me-1 text-dark"></i> Nível <span
                                        class="text-danger">*</span>
                                </label>
                                <select name="id_nivel_curso" class="form-select">
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
                                <select name="id_tipo_curso" class="form-select">
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
