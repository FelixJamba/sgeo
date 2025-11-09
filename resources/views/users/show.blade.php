@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
            <h2 class="h4 mb-0"><i class="fas fa-user-circle me-2"></i>Detalhes do Usuário</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 mt-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                            <i class="fas fa-home me-1"></i> Dashboard
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('user.index') }}" class="text-decoration-none bg">
                            <i class="fas fa-users me-1"></i> Usuários
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <i class="fas fa-user me-1"></i> {{ $user->name }}
                    </li>
                </ol>
            </nav>
        </div>

        <hr class="mt-2 mb-3">

        <!-- Card principal estilizado -->
        <div class="card border-0 shadow-sm mb-4">
            <!-- Cabeçalho do card com ações -->
            <div class="card-header bg-white py-3 d-flex flex-wrap justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Informações do Usuário</h5>
                <div class="d-flex flex-wrap gap-2">
                    @can('index-user')
                        <a href="{{ route('user.index') }}" class="btn btn-outline-primary btn-sm">
                            <i class="fas fa-list me-1"></i> Listar
                        </a>
                    @endcan

                    @can('edit-user')
                        <a href="{{ route('user.edit', $user->id) }}" class="btn btn-outline-warning btn-sm">
                            <i class="fas fa-edit me-1"></i> Editar
                        </a>
                    @endcan

                    @can('edit-user-password')
                        <a href="{{ route('user.edit-password', $user->id) }}" class="btn btn-outline-secondary btn-sm">
                            <i class="fas fa-key me-1"></i> Senha
                        </a>
                    @endcan

                    @can('destroy-user')
                        <form method="POST" action="{{ route('user.destroy', $user->id) }}" class="d-inline">
                            @csrf
                            @method('delete')
                            <button type="submit" class="btn btn-outline-danger btn-sm"
                                onclick="return confirm('Tem certeza que deseja apagar este usuário?')">
                                <i class="fas fa-trash-alt me-1"></i> Apagar
                            </button>
                        </form>
                    @endcan
                </div>
            </div>

            <!-- Corpo do card -->
            <div class="card-body">
                <x-alert />

                <!-- Lista de detalhes -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-id-card me-2"></i>ID</h6>
                            <p class="fw-bold">{{ $user->id }}</p>
                        </div>

                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-user me-2"></i>Nome</h6>
                            <p class="fw-bold">{{ $user->name }}</p>
                        </div>

                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-envelope me-2"></i>E-mail</h6>
                            <p class="fw-bold">{{ $user->email }}</p>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-user-tag me-2"></i>Papel</h6>
                            <p class="fw-bold">
                                @forelse ($user->getRoleNames() as $role)
                                    <span class="badge bg-success">{{ $role }}</span>
                                @empty
                                    <span class="text-muted">Nenhum papel atribuído</span>
                                @endforelse
                            </p>
                        </div>

                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-calendar-plus me-2"></i>Cadastrado em</h6>
                            <p class="fw-bold">
                                {{ \Carbon\Carbon::parse($user->created_at)->tz('Africa/Luanda')->format('d/m/Y H:i:s') }}
                            </p>
                        </div>

                        <div class="mb-3">
                            <h6 class="text-muted mb-2"><i class="fas fa-calendar-check me-2"></i>Última atualização</h6>
                            <p class="fw-bold">
                                {{ \Carbon\Carbon::parse($user->updated_at)->tz('Africa/Luanda')->format('d/m/Y H:i:s') }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
