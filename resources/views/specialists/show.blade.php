@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <div class="mb-1 hstack gap-2">
            <h2 class="mt-3">Perfil do Especialista</h2>
            <ol class="breadcrumb mb-3 mt-3 ms-auto">
                <li class="breadcrumb-item">
                    <a href="{{ route('dashboard.index') }}" class="text-decoration-none">
                        <i class="fas fa-home me-1"></i> Dashboard
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="{{ route('specialist.index') }}" class="text-decoration-none">
                        <i class="fas fa-user-graduate"></i> Especialistas
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    <i class="fas fa-user-shield me-1"></i> Perfil
                </li>
            </ol>
        </div>

        <hr class="mt-2 mb-3">

        <div class="card mb-4 border-light shadow">
            <div class="card-header bg-nav text-white">
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-user me-2"></i>Perfil de {{ $especialista->nome }}</span>
                    <span class="badge bg-light text-dark">{{ $especialista->posto }} | {{ $especialista->nip }}</span>
                </div>
            </div>

            <div class="card-body">
                <x-alert />

                <!-- Cabeçalho do Perfil -->
                <div class="row mb-4 profile-header">
                    <div class="col-md-3 text-center">
                        <div class="profile-image-container">
                            <img class="rounded-circle profile-img"
                                src="{{ asset('storage/' . ($especialista->foto_militar ?? 'fotos/semimagem.jpg')) }}"
                                alt="Foto do Especialista">

                        </div>
                    </div>
                    <div class="col-md-9">
                        <h3 class="profile-name">{{ $especialista->nome }}</h3>
                        <div class="row profile-details">
                            <div class="col-md-4">
                                <p><strong><i class="fas fa-id-card me-2"></i>NIP:</strong> {{ $especialista->nip }}</p>
                                <p><strong><i class="fas fa-star me-2"></i>Posto:</strong> {{ $especialista->posto }}</p>
                            </div>
                            <div class="col-md-4">
                                <p><strong><i class="fas fa-briefcase me-2"></i>Especialidade:</strong>
                                    {{ $especialista->especialidade ?? 'Não informado' }}</p>
                                <p><strong><i class="fas fa-building me-2"></i>UEO:</strong>
                                    {{ $especialista->unidade_colocado ?? 'Não informado' }}</p>
                            </div>
                            <div class="col-md-4">

                                <p><strong><i class="fas fa-clock me-2"></i>TSM: </strong>
                                    {{ $especialista->TempoServico }}
                                <p><strong><i class="fas fa-calendar-alt me-2"></i>Idade:</strong>
                                    {{ $especialista->idade }} anos</p>



                                </p>

                            </div>
                        </div>
                    </div>
                </div>
                <hr>

                <!-- Abas -->
                <ul class="nav nav-tabs nav-fill" id="profileTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="dadosMilitares-tab" data-bs-toggle="tab"
                            data-bs-target="#dadosMilitares" type="button" role="tab" aria-controls="dadosMilitares"
                            aria-selected="true">
                            <i class="fas fa-medal me-2"></i>Militares
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="dadosPessoais-tab" data-bs-toggle="tab" data-bs-target="#dadosPessoais"
                            type="button" role="tab" aria-controls="dadosPessoais" aria-selected="false">
                            <i class="fas fa-user me-2"></i>Pessoais
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="historico-tab" data-bs-toggle="tab" data-bs-target="#historico"
                            type="button" role="tab" aria-controls="historico" aria-selected="false">
                            <i class="fas fa-history me-2"></i>Histórico
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="agregado-tab" data-bs-toggle="tab" data-bs-target="#agregado"
                            type="button" role="tab" aria-controls="agregado" aria-selected="false">
                            <i class="fas fa-users me-2"></i> Agregado Familiar
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contactos-tab" data-bs-toggle="tab" data-bs-target="#contactos"
                            type="button" role="tab" aria-controls="contactos" aria-selected="false">
                            <i class="fas fa-phone me-2"></i>Contactos
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="documentos-tab" data-bs-toggle="tab" data-bs-target="#documentos"
                            type="button" role="tab" aria-controls="documentos" aria-selected="false">
                            <i class="fas fa-file-alt me-2"></i>Documentos
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="linguas-tab" data-bs-toggle="tab" data-bs-target="#linguas"
                            type="button" role="tab" aria-controls="linguas" aria-selected="false">
                            <i class="fas fa-language me-2"></i>Línguas
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="formacao-tab" data-bs-toggle="tab" data-bs-target="#formacao"
                            type="button" role="tab" aria-controls="formacao" aria-selected="false">
                            <i class="fas fa-graduation-cap me-2"></i>Formação
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="gerarDocs-tab" data-bs-toggle="tab" data-bs-target="#gerarDocs"
                            type="button" role="tab" aria-controls="gerarDocs" aria-selected="false">
                            <i class="fas fa-file-pdf me-2"></i>Relatórios
                        </button>
                    </li>
                </ul>

                <!-- Conteúdo das Abas -->
                <div class="tab-content mt-3 p-3 border border-top-0 rounded-bottom shadow-sm">
                    <!-- Aba: Dados Militares -->
                    <div class="tab-pane fade show active" id="dadosMilitares" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-calendar-day me-2"></i>Datas Importantes</h5>
                                    </div>
                                    <div class="card-body">
                                        <dl class="row mb-0">
                                            @forelse ($incorporacoes as $incorporacao)
                                                <dt class="col-sm-6">{{ $incorporacao->nome }}</dt>
                                                <dd class="col-sm-6">
                                                    {{ $incorporacao->data_incorporacao ?? 'Não informado' }}
                                                    ({{ $incorporacao->provincia ?? '' }})
                                                </dd>
                                            @empty
                                                <dt class="col-sm-6">Incorporação:</dt>
                                                <dd class="col-sm-6">Nenhuma registrada</dd>
                                            @endforelse

                                            <p class="fw-semibold">Ano provável de licenciamento a:</p>

                                            @foreach ($reforma as $item)
                                                <dt class="col-sm-6">{{ $item['label'] }}</dt>
                                                <dd class="col-sm-6">{{ $item['valor'] }}</dd>
                                            @endforeach


                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-tasks me-2"></i>Informações de Serviço</h5>
                                    </div>
                                    <div class="card-body">
                                        <dl class="row mb-0">
                                            <dt class="col-sm-6">FPS:</dt>
                                            <dd class="col-sm-6">{{ $especialista->Situacao_Quadro ?? 'Não informado' }}
                                            </dd>
                                            <dt class="col-sm-6">Direcção de Especialidade:</dt>
                                            <dd class="col-sm-6">{{ $especialista->ueo_especialidade ?? 'Não informado' }}
                                            </dd>
                                            <dt class="col-sm-6">Especialidade:</dt>
                                            <dd class="col-sm-6">{{ $especialista->especialidade ?? 'Não informado' }}
                                            </dd>
                                            <dt class="col-sm-6">Cargo:</dt>
                                            <dd class="col-sm-6">{{ $especialista->cargocolocacao ?? 'Não informado' }}
                                            </dd>
                                            <dt class="col-sm-6">UEO:</dt>
                                            <dd class="col-sm-6">{{ $especialista->unidade_colocado ?? 'Não informado' }}
                                            </dd>
                                            <dt class="col-sm-6">Situação:</dt>
                                            <dd class="col-sm-6">{{ $especialista->situacao ?? 'Não informado' }}</dd>
                                            

                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Dados Pessoais -->
                    <div class="tab-pane fade" id="dadosPessoais" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-id-card me-2"></i>Identificação</h5>
                                    </div>
                                    <div class="card-body">
                                        <dl class="row mb-0">
                                            <dt class="col-sm-4">Naturalidade:</dt>
                                            <dd class="col-sm-8">{{ $especialista->naturalidade ?? 'Não informado' }}</dd>
                                            <dt class="col-sm-4">BI:</dt>
                                            <dd class="col-sm-8">{{ $dados_bi->numero_BI ?? 'Não informado' }}</dd>
                                            <dt class="col-sm-4">Nascimento:</dt>
                                            <dd class="col-sm-8">
                                                {{ $especialista->Data_Nascimento ?? 'Não informado' }}
                                                @if ($especialista->idade)
                                                    ({{ $especialista->idade }} anos)
                                                @endif
                                            </dd>
                                            <dt class="col-sm-4">Estado Civil:</dt>
                                            <dd class="col-sm-8">{{ $especialista->estado_civil ?? 'Não informado' }}</dd>
                                            <dt class="col-sm-4">Sexo:</dt>
                                            <dd class="col-sm-8">{{ $especialista->id_sexo ?? 'Não informado' }}</dd>
                                            <dt class="col-sm-4">Alcunha:</dt>
                                            <dd class="col-sm-8">{{ $especialista->Alcunha ?? 'Não informado' }}</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-home me-2"></i>Residência</h5>
                                    </div>
                                    <div class="card-body">
                                        <div
                                            class="d-flex align-items-center justify-content-between border p-2 rounded bg-light">
                                            <span class="fw-semibold text-dark">
                                                <i class="fas fa-map-marker-alt me-2 text-secondary"></i>
                                            </span>
                                            <span class=" flex-grow-1 ms-2">
                                                {{ $endereco->endereco_completo ?? 'Endereço não especificado' }}
                                            </span>
                                        </div>

                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-user-friends me-2"></i>Filiação</h5>
                                    </div>
                                    <div class="card-body">
                                        <dl class="row mb-0">
                                            <dt class="col-sm-4">Pai:</dt>
                                            <dd class="col-sm-8">{{ $especialista->nome_pai ?? 'Não informado' }}</dd>
                                            <dt class="col-sm-4">Mãe:</dt>
                                            <dd class="col-sm-8">{{ $especialista->nome_mae ?? 'Não informado' }}</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <div class="card">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Outras Informações</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <p><strong>Grupo Sanguíneo:</strong>
                                                    {{ $especialista->Tipo_Sanguinio ?? 'Não informado' }}</p>
                                                <p><strong>Habilitação Literária:</strong>
                                                    {{ $especialista->escolaridade ?? 'Não informado' }}</p>
                                            </div>
                                            <div class="col-md-4">
                                                <p><strong>Altura:</strong> {{ $especialista->Altura ?? 'Não informado' }}
                                                </p>
                                                <p><strong>Nº Calçado:</strong>
                                                    {{ $especialista->Nro_Calcado ?? 'Não informado' }}</p>
                                            </div>
                                            <div class="col-md-4">
                                                <p><strong>Nº Camisa:</strong>
                                                    {{ $especialista->Nro_Camisa ?? 'Não informado' }}</p>
                                                <p><strong>Nº Calça:</strong>
                                                    {{ $especialista->Nro_Calca ?? 'Não informado' }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Histórico -->
                    <div class="tab-pane fade" id="historico" role="tabpanel">
                        <div class="card mb-4">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-medal me-2"></i>Progressão no Posto</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Posto</th>
                                                <th>Cargo</th>
                                                <th>Tipo Ordem</th>
                                                <th>Nº Ordem</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($historicoPosto as $historico)
                                                <tr>
                                                    <td>{{ $historico->posto_exercido_passado ?? 'Não informado' }}</td>
                                                    <td>{{ $historico->cargo_exercido ?? 'Não informado' }}</td>
                                                    <td>{{ $historico->TipoAbrev ?? 'Não informado' }}</td>
                                                    <td>
                                                        {{ $historico->N_ORDEM ?? 'N/A' }}/{{ $historico->Entidade_Abrev ?? 'N/A' }}/{{ $historico->ano ?? 'N/A' }},
                                                        de {{ $historico->dia ?? 'N/A' }} de
                                                        {{ $historico->mes ? \Carbon\Carbon::createFromFormat('m', $historico->mes)->locale('pt')->monthName : 'N/A' }}
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="4" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-briefcase me-2"></i>Progressão no Cargo</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Posto</th>
                                                <th>Cargo</th>
                                                <th>Tipo Ordem</th>
                                                <th>Nº Ordem</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($historicoCargo as $item)
                                                <tr>
                                                    <td>{{ $item->posto_exercido_passado ?? 'Não informado' }}</td>
                                                    <td>{{ $item->cargo_exercido ?? 'Não informado' }}</td>
                                                    <td>{{ $item->TipoAbrev ?? 'Não informado' }}</td>
                                                    <td>
                                                        {{ $item->N_ORDEM ?? 'N/A' }}/{{ $item->Entidade_Abrev ?? 'N/A' }}/{{ $item->ano ?? 'N/A' }},
                                                        de {{ $item->dia ?? 'N/A' }} de
                                                        {{ $item->mes ? \Carbon\Carbon::createFromFormat('m', $item->mes)->locale('pt')->monthName : 'N/A' }}
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="4" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-medal me-2"></i>Outras Ordens</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Posto</th>
                                                <th>Cargo</th>
                                                <th>Tipo Ordem</th>
                                                <th>Nº Ordem</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($historicoOutro as $item)
                                                <tr>
                                                    <td>{{ $item->posto_exercido_passado ?? 'Não informado' }}</td>
                                                    <td>{{ $item->cargo_exercido ?? 'Não informado' }}</td>
                                                    <td>{{ $item->TipoAbrev ?? 'Não informado' }}</td>
                                                    <td>
                                                        {{ $item->N_ORDEM ?? 'N/A' }}/{{ $item->Entidade_Abrev ?? 'N/A' }}/{{ $item->ano ?? 'N/A' }},
                                                        de {{ $item->dia ?? 'N/A' }} de
                                                        {{ $item->mes ? \Carbon\Carbon::createFromFormat('m', $item->mes)->locale('pt')->monthName : 'N/A' }}
                                                    </td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="4" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Agregado Familiar -->
                    <div class="tab-pane fade" id="agregado" role="tabpanel">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-users me-2"></i></h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Nome</th>
                                                <th>Parentesco</th>
                                                <th>Data de Nascimento</th>
                                                <th>Sexo</th>
                                                <th>Província</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($agregado_familiar as $agregado)
                                                <tr>
                                                    <td>{{ $agregado->Nome_Agr ?? 'Não informado' }}</td>
                                                    <td>{{ $agregado->Parentesco ?? 'Não informado' }}</td>
                                                    <td>{{ $agregado->data_nasc ?? 'Não informado' }}</td>
                                                    <td>{{ $agregado->Sexo_Agr ?? 'Não informado' }}</td>
                                                    <td>{{ $agregado->Provincia ?? 'Não informado' }}</td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="5" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Contactos -->
                    <div class="tab-pane fade" id="contactos" role="tabpanel">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-phone me-2"></i></h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Tipo</th>
                                                <th>Contacto</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($contactos as $contacto)
                                                <tr>
                                                    <td>{{ $contacto->tipoContacto ?? 'Não informado' }}</td>
                                                    <td>{{ $contacto->Contacto ?? 'Não informado' }}</td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="2" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Documentos -->
                    <div class="tab-pane fade" id="documentos" role="tabpanel">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-file-alt me-2"></i></h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Tipo</th>
                                                <th>Número</th>
                                                <th>Emissão</th>
                                                <th>Validade</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($docs as $doc)
                                                <tr>
                                                    <td>{{ $doc->nome_doc ?? 'Não informado' }}</td>
                                                    <td>{{ $doc->numero_doc ?? 'Não informado' }}</td>
                                                    <td>{{ $doc->data_emissao ?? 'Não informado' }}</td>
                                                    <td>{{ $doc->data_validade ?? 'Não informado' }}</td>
                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="4" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Línguas -->
                    <div class="tab-pane fade" id="linguas" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-3">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-flag me-2"></i>Línguas Nacionais</h5>
                                    </div>
                                    <div class="card-body">
                                        @forelse ($linguasN as $linguaN)
                                            <span
                                                class="badge bg-primary me-2 mb-2">{{ $linguaN->descricaoLingua ?? 'Não informado' }}</span>
                                        @empty
                                            <p class="text-muted">Nenhuma língua nacional registrada</p>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header bg-light">
                                        <h5 class="mb-0"><i class="fas fa-globe me-2"></i>Línguas Estrangeiras</h5>
                                    </div>
                                    <div class="card-body">
                                        @forelse ($linguasE as $lingua)
                                            <span
                                                class="badge bg-success me-2 mb-2">{{ $lingua->descricaoLingua ?? 'Não informado' }}</span>
                                        @empty
                                            <p class="text-muted">Nenhuma língua estrangeira registrada</p>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Formação -->
                    <div class="tab-pane fade" id="formacao" role="tabpanel">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-graduation-cap me-2"></i></h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Instituição</th>
                                                <th>Curso</th>
                                                <th>Período</th>
                                                <th>Nível</th>
                                                <th>Nota</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($formacoes as $formacao)
                                                <tr>
                                                    <td>{{ $formacao->nome_instituicao ?? 'Não informado' }}</td>
                                                    <td>{{ $formacao->nome_curso ?? 'Não informado' }}</td>
                                                    <td>
                                                        {{ $formacao->data_inicio ?? 'N/A' }}
                                                        @if ($formacao->data_inicio && $formacao->data_fim)
                                                            a
                                                        @endif
                                                        {{ $formacao->data_fim ?? 'N/A' }}
                                                    </td>
                                                    <td>{{ $formacao->nive_curso ?? 'Não informado' }}</td>

                                                    <td>{{ $formacao->nota ?? 'Não informado' }}</td>

                                                </tr>
                                            @empty
                                                <tr>
                                                    <td colspan="6" class="text-center">Nenhum registro encontrado</td>
                                                </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Aba: Gerar Docs -->
                    <div class="tab-pane fade" id="gerarDocs" role="tabpanel">
                        <div class="card">
                            <div class="card-header bg-light">
                                <h5 class="mb-0"><i class="fas fa-file-pdf me-2"></i>Gerar Documentos</h5>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2 d-md-block">
                                    <a href="{{ route('relatorio.especialista', ['id' => $especialista->id_pessoa_fisica]) }}"
                                        target="_blank" class="btn btn-danger me-2">
                                        <i class="fas fa-file-pdf me-1"></i> Gerar PDF Completo
                                    </a>
                                    <button class="btn btn-outline-secondary me-2 disabled">
                                        <i class="fas fa-file-word me-1"></i> Gerar Declaração
                                    </button>
                                    <button class="btn btn-outline-secondary disabled">
                                        <i class="fas fa-file-excel me-1"></i> Gerar Relatório
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="{{ route('specialist.edit', ['id' => $especialista->id_pessoa_fisica]) }}"
                        class="btn btn-warning  btn-md mt-3">
                        <i class="fas fa-edit me-2"></i>Editar</a>

                    <a href="{{ route('specialist.create') }}" class="btn btn-success  btn-md mt-3">
                        <i class="fas fa-plus-circle me-2"></i>Cadastrar</a>
                </div>
            </div>
        </div>
    </div>
@endsection
