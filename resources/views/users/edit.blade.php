@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4">
        <!-- Cabeçalho melhorado -->
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-2">
            <h2 class="h4 mb-0"><i class="fas fa-user-edit me-2"></i>Editar Usuário</h2>
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
                        <i class="fas fa-edit me-1"></i> Editar
                    </li>
                </ol>
            </nav>
        </div>

        <hr class="mt-2 mb-3">

        <!-- Card principal estilizado -->
        <div class="card border-0 shadow-sm mb-4">
            <!-- Cabeçalho do card com ações -->
            <div class="card-header bg-white py-3 d-flex flex-wrap justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fas fa-user-cog me-2"></i>Formulário de Edição</h5>
                <div class="d-flex flex-wrap gap-2">
                    @can('index-user')
                        <a href="{{ route('user.index') }}" class="btn btn-outline-primary btn-sm">
                            <i class="fas fa-list me-1"></i> Listar
                        </a>
                    @endcan

                    @can('show-user')
                        <a href="{{ route('user.show', $user->id) }}" class="btn btn-outline-info btn-sm">
                            <i class="fas fa-eye me-1"></i> Visualizar
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

                <form action="{{ route('user.update', $user->id) }}" method="POST" class="row g-3">
                    @csrf
                    @method('PUT')

                    <!-- Campo Nome -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name" class="form-label fw-bold">
                                <i class="fas fa-user me-1"></i> Nome Completo
                            </label>
                            <input type="text" name="name" id="name"
                                class="form-control @error('name') is-invalid @enderror"
                                placeholder="Digite o nome completo" value="{{ old('name', $user->name) }}">
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
                                class="form-control @error('email') is-invalid @enderror" placeholder="Digite o e-mail"
                                value="{{ old('email', $user->email) }}">
                            @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <!-- Campo Papel -->
                    <div class="col-12">
                        <div class="form-group">
                            <label for="roles" class="form-label fw-bold">
                                <i class="fas fa-user-tag me-1"></i> Papel
                            </label>

                            @if (Auth::user()->hasRole('Super Admin'))
                                <!-- Super Admin pode editar -->
                                <select name="roles" id="roles"
                                    class="form-select @error('roles') is-invalid @enderror">
                                    <option value="">Selecione um papel...</option>
                                    @foreach ($roles as $role)
                                        <option value="{{ $role }}"
                                            {{ old('roles', $userRoles) == $role ? 'selected' : '' }}>
                                            {{ $role }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('roles')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            @else
                                <!-- Usuário comum só vê o papel atual -->
                                <input type="text" class="form-control" value="{{ $userRoles }}" disabled>
                            @endif
                        </div>
                    </div>


                    <!-- Botão de submit -->
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-warning">
                            <i class="fas fa-save me-1"></i> Salvar Alterações
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
