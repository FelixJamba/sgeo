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
                <span><i class="fas fa-eye me-2"></i> Visualizar</span>
                <div class="d-flex gap-2">
                    @can('index-structure')
                        <a href="{{ route('structure.index') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-list me-1"></i> Listar
                        </a>
                        <a href="{{ route('structure.edit', ['id' => $estrutura->id_estrutura_organica]) }}"
                            class="btn btn-light btn-sm">
                            <i class="fas fa-edit me-1"></i> Editar
                        </a>
                    @endcan
                </div>
            </div>
        </div>

        <div class="card-body">
            <x-alert />

            <div class="row g-4 mb-4">
                <!-- Detalhes da Estrutura -->
                <div class="col-lg-6">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-header bg-light">
                            <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Detalhes da Estrutura</h5>
                        </div>
                        <div class="card-body">
                            <dl class="row mb-0">
                                
                                <dt class="col-sm-4">Unidade:</dt>
                                <dd class="col-sm-8">{{ $estrutura->nome_unidade }}</dd>

                                <dt class="col-sm-4">Cargo:</dt>
                                <dd class="col-sm-8">{{ $estrutura->cargo }}</dd>

                                <dt class="col-sm-4">Função:</dt>
                                <dd class="col-sm-8">{{ $estrutura->funcao }}</dd>

                                <dt class="col-sm-4">Quantidade Org:</dt>
                                <dd class="col-sm-8">{{ $estrutura->qtd_org }}</dd>

                                <dt class="col-sm-4">Posto Orgânico:</dt>
                                <dd class="col-sm-8">{{ $estrutura->Posto }}</dd>

                                <dt class="col-sm-4">Vagas Disponíveis:</dt>
                                <dd class="col-sm-8">
                                    <span class="badge bg-{{ ($estrutura->qtd_org - $estrutura->contar_cargos) <= 0 ? 'danger' : 'success' }}">
                                        {{ $estrutura->qtd_org - $estrutura->contar_cargos }}
                                    </span>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <!-- Adicionar Pessoa -->
                <div class="col-lg-6">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-header bg-light">
                            <h5 class="mb-0"><i class="fas fa-user-plus me-2"></i>Adicionar Pessoa no Cargo</h5>
                        </div>
                        <div class="card-body">
                            @can('add-person')
                            <form action="{{ route('structure.addPerson', ['id' => $estrutura->id_estrutura_organica]) }}" method="POST">
                                @csrf
                                <div class="mb-3">
                                    <label for="pesquisar_nip" class="form-label">Pesquisar Militar</label>
                                    <div class="input-group">
                                        <input type="hidden" name="id_pessoa_juridica" id="id_pessoa_juridica">
                                        <input type="text" class="form-control border-warning"
                                               id="pesquisar_nip" name="pesquisar_nip"
                                               placeholder="Digite o NIP ou nome" required autocomplete="off">
                                        <button type="submit" class="btn btn-success">
                                            <i class="fas fa-plus me-1"></i> Adicionar
                                        </button>
                                    </div>
                                    <div id="autocomplete-results" class="list-group mt-2 d-none"></div>
                                </div>
                            </form>
                            @else
                                <div class="alert alert-warning mb-0">
                                    <i class="fas fa-exclamation-triangle me-2"></i> Você não tem permissão para adicionar pessoas
                                </div>
                            @endcan
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pessoas no Cargo -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-light">
                    <h5 class="mb-0"><i class="fas fa-users me-2"></i>Pessoa(s) no Cargo</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="text-center">NIP</th>
                                    <th class="text-center">Posto</th>
                                    <th class="text-center">Nome</th>
                                    <th class="text-center">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($pessoas as $pessoa)
                                    <tr>
                                        <td class="text-center align-middle">{{ $pessoa->nip }}</td>
                                        <td class="text-center align-middle">
                                            <span class="badge bg-success">{{ $pessoa->posto }}</span>
                                        </td>
                                        <td class="text-center align-middle">{{ $pessoa->nome }}</td>
                                        <td class="text-center align-middle">
                                            @can('destroy-person')
                                                <form action="{{ route('destroy.pessoa', ['id' => $pessoa->id_cp]) }}"
                                                    method="POST" class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger btn-sm btn-delete"
                                                        onclick="">
                                                        <i class="fas fa-trash me-1"></i> Remover
                                                    </button>
                                                </form>
                                            @endcan
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="text-center py-4">
                                            <div class="alert alert-info mb-0">
                                                <i class="fas fa-info-circle me-2"></i> Nenhuma pessoa associada a este cargo
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection



