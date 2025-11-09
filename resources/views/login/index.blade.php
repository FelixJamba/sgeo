@extends('layouts.login')

@section('content')
    <div class="login-wrapper">
        <div class="login-container">
            <!-- LOGO + NOME DO SISTEMA -->
            <div class="logo-container">
                <div class="logo-content">
                    <img src="{{ asset('images/exercito.png') }}" alt="Logo Exército Angolano" class="logo-img">
                    <h2 class="app-name">SIGEEO</h2>
                    <p class="app-desc">Sistema de Gestão de Especialistas e Estrutura Orgânica</p>
                </div>
            </div>

            <!-- FORMULÁRIO -->
            <div class="form-container">
                <x-alert />

                <form action="{{ route('login.process') }}" method="POST">
                    @csrf

                    <!-- Campo Email -->
                    <label for="email" class="label">Email:</label>
                    <input class="input" type="email" id="email" name="email" placeholder="Digite seu e-mail"
                           value="{{ old('email') }}" required />

                    <!-- Campo Senha -->
                    <label for="password" class="label">Senha:</label>
                    <input class="input" type="password" id="password" name="password" placeholder="Digite sua senha" required />

                    <!-- Botão -->
                    <button class="button" type="submit">
                        <i class="fas fa-sign-in-alt me-2"></i> Acessar
                    </button>

                    <!-- Link de recuperação -->
                    <p class="text-center mt-2">
                        <a href="{{ route('forgot-password.show') }}" style="color: #276209;">
                            <i class="fas fa-key me-1"></i>Esqueceu a senha?
                        </a>
                    </p>
                </form>

                <!-- Versão -->
                <p class="small text-muted mt-4">
                    Versão {{ config('app.version') }} &copy; {{ date('Y') }} - DI/EXE
                </p>
            </div>
        </div>
    </div>
@endsection
