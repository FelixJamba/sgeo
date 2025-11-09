@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
            <h2 class="h4 mb-0"><i class="fas fa-key me-2"></i>Alterar Senha</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 mt-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                            <i class="fas fa-home me-1"></i> Dashboard
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('user.index') }}" class="text-decoration-none">
                            <i class="fas fa-users me-1"></i> Usuários
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <i class="fas fa-lock me-1"></i> Alterar Senha
                    </li>
                </ol>
            </nav>
        </div>

        <!-- Card principal estilizado -->
        <div class="card border-0 shadow-sm mb-4">
            <!-- Cabeçalho do card com ações -->
            <div class="card-header bg-nav py-3 d-flex flex-wrap justify-content-between align-items-center">
                <h5 class="mb-0 text-white"><i class="fas fa-user-shield me-2"></i>Formulário de Alteração de Senha</h5>
                <div class="d-flex flex-wrap gap-2">
                    @can('index-user')
                        <a href="{{ route('user.index') }}" class="btn btn-light btn-sm text-dark">
                            <i class="fas fa-list me-1"></i> Listar Usuários
                        </a>
                    @endcan

                    @can('show-user')
                        <a href="{{ route('user.show', $user->id) }}" class="btn btn-light btn-sm text-dark">
                            <i class="fas fa-eye me-1"></i> Visualizar
                        </a>
                    @endcan
                </div>
            </div>

            <!-- Corpo do card -->
            <div class="card-body">
                <x-alert />

                <form action="{{ route('user.update-password', $user->id) }}" method="POST" class="row g-3">
                    @csrf
                    @method('PUT')

                    <!-- Campo Nova Senha -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="password" class="form-label fw-bold">
                                <i class="fas fa-lock me-1"></i> Nova Senha
                            </label>
                            <input type="password" name="password" id="password"
                                   class="form-control @error('password') is-invalid @enderror"
                                   placeholder="Digite a nova senha (mínimo 6 caracteres)"
                                   required>
                            @error('password')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Campo Confirmação de Senha -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="password_confirmation" class="form-label fw-bold">
                                <i class="fas fa-lock me-1"></i> Confirmar Senha
                            </label>
                            <input type="password" name="password_confirmation" id="password_confirmation"
                                   class="form-control"
                                   placeholder="Confirme a nova senha"
                                   required>
                        </div>
                    </div>

                    <!-- Botão de submit -->
                    <div class="col-12 mt-3">
                        <button type="submit" class="btn btn-warning">
                            <i class="fas fa-save me-1"></i> Actualizar Senha
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
