@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
            <h2 class="h4 mb-0"><i class="fas fa-user-plus me-2"></i>Cadastrar Usuário</h2>
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
                        <i class="fas fa-plus-circle me-1"></i> Cadastrar
                    </li>
                </ol>
            </nav>
        </div>
        
        <hr class="mt-2 mb-3">

        <!-- Card principal estilizado -->
        <div class="card border-0 shadow-sm mb-4">
            <!-- Cabeçalho do card com ações -->
            <div class="card-header bg-nav py-3 d-flex flex-wrap justify-content-between align-items-center text-white">
                <h5 class="mb-0"><i class="fas fa-user-edit me-2"></i>Formulário de Cadastro</h5>
                <div class="d-flex flex-wrap gap-2">
                    @can('index-user')
                        <a href="{{ route('user.index') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-list me-1"></i> Listar Usuários
                        </a>
                    @endcan
                </div>
            </div>

            <!-- Corpo do card -->
            <div class="card-body">
                <x-alert />

                <form action="{{ route('user.store') }}" method="POST" class="row g-3">
                    @csrf
                    @method('POST')

                    <!-- Campo Nome -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name" class="form-label fw-bold">
                                <i class="fas fa-user me-1"></i> Nome Completo
                            </label>
                            <input type="text" name="name" id="name"
                                   class="form-control @error('name') is-invalid @enderror"
                                   placeholder="Digite o nome completo"
                                   value="{{ old('name') }}" required>
                            @error('name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Campo E-mail -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email" class="form-label fw-bold">
                                <i class="fas fa-envelope me-1"></i> E-mail
                            </label>
                            <input type="email" name="email" id="email"
                                   class="form-control @error('email') is-invalid @enderror"
                                   placeholder="Digite o e-mail válido"
                                   value="{{ old('email') }}" required>
                            @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Campo Senha -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="password" class="form-label fw-bold">
                                <i class="fas fa-lock me-1"></i> Senha
                            </label>
                            <input type="password" name="password" id="password"
                                   class="form-control @error('password') is-invalid @enderror"
                                   placeholder="Mínimo 6 caracteres"
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
                                   placeholder="Confirme a senha"
                                   required>
                        </div>
                    </div>

                    <!-- Campo Papel -->
                    <div class="col-12">
                        <div class="form-group">
                            <label for="roles" class="form-label fw-bold">
                                <i class="fas fa-user-tag me-1"></i> Papel
                            </label>
                            <select name="roles" id="roles"
                                    class="form-select @error('roles') is-invalid @enderror" required>
                                <option value="">Selecione um papel...</option>
                                @foreach ($roles as $role)
                                    @if ($role != 'Super Admin')
                                        <option value="{{ $role }}" {{ old('roles') == $role ? 'selected' : '' }}>
                                            {{ $role }}
                                        </option>
                                    @elseif (Auth::user()->hasRole('Super Admin'))
                                        <option value="{{ $role }}" {{ old('roles') == $role ? 'selected' : '' }}>
                                            {{ $role }}
                                        </option>
                                    @endif
                                @endforeach
                            </select>
                            @error('roles')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Botão de submit -->
                    <div class="col-12 mt-3">
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-save me-1"></i> Cadastrar Usuário
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
