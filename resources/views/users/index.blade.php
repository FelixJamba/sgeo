@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-3">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
            <h2 class="h4 mb-0"><i class="fas fa-users me-2"></i>Usuários</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 mt-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                            <i class="fas fa-home me-1"></i> Dashboard
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <i class="fas fa-users me-1"></i> Usuários
                    </li>
                </ol>
            </nav>
        </div>
        
        <hr class="mt-2 mb-3">

        <!-- Card principal estilizado -->
        <div class="card border-0 shadow-sm mb-4">
            <!-- Cabeçalho do card com ações -->
            <div class="card-header bg-nav d-flex flex-wrap justify-content-between align-items-center text-white">
                <h5 class="mb-0"><i class="fas fa-list me-2"></i>Lista de Usuários</h5>
                <div class="btn-group" role="group">
                    @can('create-user')
                        <a href="{{ route('user.create') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle me-1"></i> Cadastrar
                        </a>
                    @endcan

                </div>
            </div>

            <!-- Corpo do card -->
            <div class="card-body">
                <x-alert />

                <!-- Tabela responsiva -->
                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0">
                        <thead class="table-light">
                            <tr>
                                <th width="80">ID</th>
                                <th>Nome</th>
                                <th class="d-none d-md-table-cell">E-mail</th>
                                <th width="280" class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($users as $user)
                                <tr>
                                    <td class="fw-bold">{{ $user->id }}</td>
                                    <td>{{ $user->name }}</td>
                                    <td class="d-none d-md-table-cell text-muted">{{ $user->email }}</td>
                                    <td>
                                        <div class="d-flex flex-wrap justify-content-center gap-1">
                                            @can('show-user')
                                                <a href="{{ route('user.show', $user->id) }}"
                                                   class="btn btn-sm btn-outline-primary"  data-bs-toggle="tooltip" title="Visualizar">
                                                    <i class="far fa-eye me-1"></i>
                                                </a>
                                            @endcan

                                            @can('edit-user')
                                                <a href="{{ route('user.edit', $user->id) }}"
                                                   class="btn btn-sm btn-outline-warning"  data-bs-toggle="tooltip" title="Editar">
                                                    <i class="fas fa-edit me-1"></i>
                                                </a>
                                            @endcan

                                            @can('destroy-user')
                                                <form method="POST" action="{{ route('user.destroy', $user->id) }}"
                                                      class="d-inline">
                                                    @csrf
                                                    @method('delete')
                                                    <button type="submit" class="btn btn-sm btn-outline-danger  btn-delete"
                                                             data-bs-toggle="tooltip" title="Excluir">
                                                        <i class="far fa-trash-alt me-1"></i> 
                                                    </button>
                                                </form>
                                            @endcan
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center py-4 text-muted">
                                        <i class="fas fa-user-slash fa-2x mb-3"></i>
                                        <p class="mb-0">Nenhum usuário encontrado!</p>
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                <!-- Paginação estilizada -->
                @if($users->hasPages())
                    <div class="d-flex justify-content-center mt-4">
                        <nav aria-label="Page navigation">
                            {{ $users->onEachSide(1)->links('pagination::bootstrap-4') }}
                        </nav>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
