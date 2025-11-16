@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <div class="mb-3 hstack gap-2">
            <h2 class="mt-3"><i class="fas fa-sitemap me-2"></i>Estrutura Orgânica</h2>
            <ol class="breadcrumb mb-3 mt-3 ms-auto">
                <li class="breadcrumb-item">
                    <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                        <i class="fas fa-home me-1"></i> Dashboard
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    <i class="fas fa-sitemap me-1"></i> Estrutura Orgânica
                </li>
            </ol>
        </div>

        <hr class="mt-2 mb-3">

        <div class="card mb-4 border-0 shadow-sm">
            <div class="card-header bg-nav text-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h5><i class="fas fa-edit me-2"></i> Editar</h5>
                    <div class="d-flex gap-2">
                        @can('index-structure')
                            <a href="{{ route('structure.index') }}" class="btn btn-light btn-sm">
                                <i class="fas fa-list me-1"></i> Listar
                            </a>
                        @endcan
                        @can('show-structure')
                            <a href="{{ route('structure.show', ['id' => $estrutura->id_estrutura_organica]) }}"
                                class="btn btn-light btn-sm">
                                <i class="fas fa-eye me-1"></i> Visualizar
                            </a>
                        @endcan
                        @can('create-structure')
                            <a href="{{ route('structure.create') }}" class="btn btn-light btn-sm">
                                <i class="fas fa-plus-circle me-1"></i> Cadastrar
                            </a>
                        @endcan
                    </div>
                </div>
            </div>

            <div class="card-body">
                <x-alert />

                <div class="d-flex gap-2 align-items-center mb-3">

                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body p-4">
                                <form action="{{ route('structure.update', $estrutura->id_estrutura_organica) }}"
                                    method="POST">
                                    @csrf
                                    @method('PUT')

                                    <!-- Região e Unidade -->
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select class="form-select" name="ramo" id="ramo">
                                                    <option value="">Selecione o ramo</option>
                                                    @foreach ($ramos as $ramo)
                                                        <option value="{{ $ramo->RamoID }}"
                                                            {{ old('ramo', $estrutura->RamoID ?? '') == $ramo->RamoID ? 'selected' : '' }}>
                                                            {{ $ramo->DescRamo }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="ramo" class="text-muted">
                                                    <i class="fas fa-flag me-1"></i> Ramo
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="regiao" name="regiao" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($regioes as $regiao)
                                                        <option value="{{ $regiao->CodRM }}"
                                                            {{ old('regiao', $estrutura->id_regiao) == $regiao->CodRM ? 'selected' : '' }}>
                                                            {{ $regiao->Designacao_RM }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="regiao" id="label-regiao"><i
                                                        class="fas fa-map-marked-alt me-2"></i>Região</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="unidade" name="unidade" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($unidadesMilitares as $unidade)
                                                        <option value="{{ $unidade->UnidadeID }}"
                                                            {{ old('unidade', $estrutura->id_unidade_pai) == $unidade->UnidadeID ? 'selected' : '' }}>
                                                            {{ $unidade->Ueo }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_pai"><i class="fas fa-building me-2"></i>UEO</label>
                                                <x-alert field="id_pai" />
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Subunidades -->
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="id_sub_unidade_mae" name="id_sub_unidade_mae"
                                                    class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($subUnidades as $unidade)
                                                        <option value="{{ $unidade->id_es }}"
                                                            {{ old('id_sub_unidade_mae', $estrutura->id_sub_unidade_mae) == $unidade->id_es ? 'selected' : '' }}>
                                                            {{ $unidade->descricao_sub_unidade }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_sub_unidade_mae"><i
                                                        class="fas fa-level-up-alt me-2"></i>UEO Superior</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="id_sub_unidade_filho" name="id_sub_unidade_filho"
                                                    class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($subUnidades as $unidade)
                                                        <option value="{{ $unidade->id_es }}"
                                                            {{ old('id_sub_unidade_filho', $estrutura->id_sub_sub_filho) == $unidade->id_es ? 'selected' : '' }}>
                                                            {{ $unidade->descricao_sub_unidade }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_sub_unidade_filho"><i
                                                        class="fas fa-level-down-alt me-2"></i>UEO Inferior</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="id_funcao" name="id_funcao" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($funcoes as $funcao)
                                                        <option value="{{ $funcao->id_funcao }}"
                                                            {{ old('id_funcao', $estrutura->id_funcao) == $funcao->id_funcao ? 'selected' : '' }}>
                                                            {{ $funcao->nome_funcao }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_funcao"><i class="fas fa-briefcase me-2"></i>Função</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cargo e Posto -->
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="id_cargo" name="id_cargo" class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($cargos as $cargo)
                                                        <option value="{{ $cargo->id_cargo }}"
                                                            {{ old('id_cargo', $estrutura->id_cargo) == $cargo->id_cargo ? 'selected' : '' }}>
                                                            {{ $cargo->nome_cargo }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_cargo"><i class="fas fa-user-tie me-2"></i>Cargo</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="id_posto_organico" name="id_posto_organico"
                                                    class="form-select">
                                                    <option value="">Selecione</option>
                                                    @foreach ($postos as $posto)
                                                        <option value="{{ $posto->Posto_Id }}"
                                                            {{ old('id_posto_organico', $estrutura->id_posto_organico) == $posto->Posto_Id ? 'selected' : '' }}>
                                                            {{ $posto->Posto }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <label for="id_posto_organico"><i class="fas fa-medal me-2"></i>Posto
                                                    Orgânico</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="number" name="qtd_org" id="qtd_org" class="form-control"
                                                    value="{{ old('qtd_org', $estrutura->quantidade_organica) }}"
                                                    placeholder="Quantidade Orgânica">
                                                <label for="qtd_org"><i class="fas fa-users me-2"></i>Quantidade
                                                    Orgânica</label>
                                            </div>
                                        </div>
                                    </div>



                                    <!-- Tipo de Cargo -->
                                    <div class="row g-3 mb-4">
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <select id="principal_cargo" name="principal_cargo" class="form-select">
                                                    <option value="1"
                                                        {{ old('principal_cargo', $estrutura->tipo_cargo) == 1 ? 'selected' : '' }}>
                                                        Sim</option>
                                                    <option value="0"
                                                        {{ old('principal_cargo', $estrutura->tipo_cargo) == 0 ? 'selected' : '' }}>
                                                        Não</option>
                                                </select>
                                                <label for="principal_cargo"><i class="fas fa-star me-2"></i>Principal
                                                    Cargo?</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botões -->
                                    <div class="d-flex justify-content-end flex-wrap gap-2 mt-4">
                                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#modalCadastrarUnidade">
                                            <i class="fas fa-plus-circle me-1"></i> Cadastrar Nova Subunidade
                                        </button>

                                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#modalCadastrarCargo">
                                            <i class="fas fa-plus-circle me-1"></i> Cadastrar Novo Cargo
                                        </button>

                                        <button type="submit" class="btn btn-warning">
                                            <i class="fas fa-save me-2"></i> Actualizar Estrutura
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCadastrarUnidade" tabindex="-1" aria-labelledby="modalCadastrarUnidadeLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-dark">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="modalCadastrarUnidadeLabel">
                        <i class="fas fa-plus-circle me-2"></i> Cadastrar Subunidade
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <form id="modalCadastrarUnidade" method="POST" action="{{ route('store.sub') }}">
                        @csrf

                        <div class="row g-3 mb-4">
                            <!-- Descrição da Subunidade -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="descricao_sub_unidade" class="form-label fw-bold">
                                        <i class="fas fa-align-left me-1"></i> Descrição <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input name="descricao_sub_unidade" id="descricao_sub_unidade" type="text"
                                        class="form-control @error('descricao_sub_unidade') is-invalid @enderror"
                                        placeholder="Digite a descrição da subunidade"
                                        value="{{ old('descricao_sub_unidade') }}" required>
                                    @error('descricao_sub_unidade')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <!-- Tipo de Subunidade -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_tipo" class="form-label fw-bold">
                                        <i class="fas fa-tag me-1"></i> Tipo <span class="text-danger">*</span>
                                    </label>
                                    <select name="id_tipo" id="id_tipo"
                                        class="form-select @error('id_tipo') is-invalid @enderror" required>
                                        <option value="">Selecione o tipo...</option>
                                        @foreach ($tipos as $tipo)
                                            <option value="{{ $tipo->id_tipo_subunidade }}"
                                                {{ old('id_tipo') == $tipo->id_tipo_subunidade ? 'selected' : '' }}>
                                                {{ $tipo->descricao }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('id_tipo')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <!-- Rodapé do formulário -->
                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <small class="text-muted"><span class="text-danger">*</span> Campos obrigatórios</small>
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save me-1"></i> Salvar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCadastrarCargo" tabindex="-1" aria-labelledby="modalCadastrarCargoLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-dark">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title" id="modalCadastrarCargoLabel">
                        <i class="fas fa-plus-circle me-2"></i> Cadastrar Subunidade
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <form id="modalCadastrarCargo" method="POST" action="{{ route('store.position') }}">
                        @csrf

                        <div class="row g-3">
                            <!-- Campo Nome do Cargo -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="nome_cargo" class="form-label fw-bold">
                                        <i class="fas fa-id-card me-1"></i> Nome do Cargo <span
                                            class="text-danger">*</span>
                                    </label>
                                    <input name="nome_cargo" id="nome_cargo" type="text"
                                        class="form-control @error('nome_cargo') is-invalid @enderror"
                                        placeholder="Digite o nome do cargo" value="{{ old('nome_cargo') }}" required>
                                    @error('nome_cargo')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <!-- Campo Função -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="id_funcao" class="form-label fw-bold">
                                        <i class="fas fa-tasks me-1"></i> Função <span class="text-danger">*</span>
                                    </label>
                                    <select name="id_funcao" id="id_funcao"
                                        class="form-select @error('id_funcao') is-invalid @enderror" required>
                                        <option value="">Selecione uma função...</option>
                                        @foreach ($funcoes as $funcao)
                                            <option value="{{ $funcao->id_funcao }}"
                                                {{ old('id_funcao') == $funcao->id_funcao ? 'selected' : '' }}>
                                                {{ $funcao->nome_funcao }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('id_funcao')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <!-- Rodapé do formulário -->
                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <small class="text-muted"><span class="text-danger">*</span> Campos obrigatórios</small>
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save me-1"></i> Salvar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
