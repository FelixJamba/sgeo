@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <div class="mb-1 hstack gap-2">
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
                    <h5><i class="fas fa-list me-2"></i> Lista de Estruturas Orgânicas</h5>
                    @can('create-structure')
                        <a href="{{ route('structure.create') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle me-1"></i> Cadastrar
                        </a>
                    @endcan
                </div>
            </div>

            <div class="card-body">
                <x-alert />

                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle" id="table-estrutura">
                        <thead class="table-light">
                            <tr>
                                <th class="d-none d-sm-table-cell">UEO</th>
                                <th class="d-none d-md-table-cell">Cargo</th>
                                <th class="d-none d-md-table-cell">Pessoa</th>
                                <th class="d-none d-md-table-cell">Qtd Orgânica</th>
                                <th class="text-center">Ações</th>
                            </tr>
                        </thead>

                        <tbody>
                            @forelse ($estruturas as $estrutura)
                                <tr class="hover-shadow">
                                    <td class="">
                                        <span class="text-wrap fw-semibold">{{ $estrutura->unidade_mae }}</span>
                                    </td>
                                    <td class="d-none d-md-table-cell">{{ $estrutura->cargo }}</td>
                                    <td class="d-none d-md-table-cell">{{ $estrutura->pessoa }}</td>
                                    <td class="d-none d-md-table-cell">
                                        <span class="badge bg-success">{{ $estrutura->qtd_org }}</span>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-center gap-2">
                                            @can('show-structure')
                                                <a href="{{ route('structure.show', ['id' => $estrutura->id_estrutura_organica]) }}"
                                                    class="btn btn-outline-primary btn-sm"
                                                    data-bs-toggle="tooltip" title="Visualizar">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            @endcan

                                            @can('edit-structure')
                                                <a href="{{ route('structure.edit', ['id' => $estrutura->id_estrutura_organica]) }}"
                                                    class="btn btn-outline-warning btn-sm"
                                                    data-bs-toggle="tooltip" title="Editar">
                                                    <i class="fas fa-pen"></i>
                                                </a>
                                            @endcan

                                            @can('destroy-structure')
                                                <form action="{{ route('structure.destroy', ['id' => $estrutura->id_estrutura_organica]) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger btn-sm btn-delete"
                                                        data-bs-toggle="tooltip" title="Excluir"
                                                        onclick="">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            @endcan
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center py-4">
                                        <div class="alert alert-warning" role="alert">
                                            <i class="fas fa-exclamation-circle me-2"></i> Nenhum registro encontrado!
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
@endsection


