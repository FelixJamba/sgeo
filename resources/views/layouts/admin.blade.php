<!DOCTYPE html>
<html lang="pt-br" class="h-100">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="estrutura, militar, gestão, SIGEO, organização, especialista">


    <!-- Favicon -->
    <link rel="icon" href="{{ asset('favicon.ico') }}" type="image/x-icon">

    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css">

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <title>SIGEEO - Sistema Integrado de Gestão e Estrutura Orgânica</title>

    <style>
        /* Adicionar ao CSS para melhorar o comportamento */
.sb-sidenav {
    overflow-y: auto; /* Garante apenas uma barra de rolagem */
    height: calc(100% - 56px); /* Ajusta altura considerando o footer */
}

.sb-sidenav-menu {
    flex-wrap: nowrap; /* Evita quebra indesejada */
}
    </style>
</head>

<body class="d-flex flex-column h-100 bg-light">
    <!-- Top Navigation - Versão Corrigida -->
    <nav class="navbar navbar-expand navbar-dark bg-nav fixed-top shadow-sm py-2">
        <div class="container-fluid px-3">
            <!-- Brand & Toggle - Corrigido -->
            <div class="d-flex align-items-center">
                <button class="btn btn-link text-white me-3" id="sidebarToggle">
                    <i class="fas fa-bars fa-lg"></i>
                </button>
                <a class="navbar-brand fw-bold text-white" href="#">
                    <i class="fas fa-sitemap me-2"></i>Sistema Integrado de Gestão de Especialistas e Estrutura Orgânica
                </a>
            </div>

            <!-- User Menu -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="navbarDropdown">
                        <li>
                            <a class="dropdown-item" href="{{ route('profile.show') }}">
                                <i class="fas fa-user me-2"></i> Perfil
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" href="{{ route('login.destroy') }}">
                                <i class="fas fa-sign-out-alt me-2"></i> Sair
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>

    <!-- Main Wrapper -->
    <div id="layoutSidenav">
        <!-- Sidebar Navigation -->
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark">
                <div class="sb-sidenav-menu">
                    <div class="nav flex-column">
                        <!-- Dashboard -->
                        <a @class(['nav-link', 'active' => isset($menu) && $menu == 'dashboard']) href="{{ route('dashboard.index') }}">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-tachometer-alt"></i>
                            </div>
                            Dashboard
                        </a>

                        <!-- Users -->
                        @can('index-user')
                        <a @class(['nav-link', 'active' => isset($menu) && $menu == 'users']) href="{{ route('user.index') }}">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            Usuários
                        </a>
                        @endcan

                        <!-- Specialists -->
                        @can('index-specialist')
                        <a @class(['nav-link', 'active' => isset($menu) && $menu == 'specialists']) href="{{ route('specialist.index') }}">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            Especialistas
                        </a>
                        @endcan

                        <!-- Structure -->
                        @can('index-structure')
                        <div class="nav-item">
                            <a class="nav-link collapsed @if(isset($menu) && $menu == 'structures') active @endif"
                               data-bs-toggle="collapse" href="#collapseStructures"
                               aria-expanded="false" aria-controls="collapseStructures">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-sitemap"></i>
                                </div>
                                Estrutura Orgânica
                                <div class="sb-sidenav-collapse-arrow">
                                    <i class="fas fa-angle-down"></i>
                                </div>
                            </a>
                            <div class="collapse" id="collapseStructures">
                                <nav class="sb-sidenav-menu-nested nav flex-column">
                                    <a class="nav-link" href="{{ route('structure.index') }}">
                                        <i class="fas fa-list me-2"></i> Listar
                                    </a>
                                    <a class="nav-link" href="{{ route('structure.create') }}">
                                        <i class="fas fa-plus-circle me-2"></i> Cadastrar
                                    </a>
                                    <a class="nav-link" href="{{ route('structure.head') }}">
                                        <i class="fas fa-project-diagram me-2"></i> Cadeia de Comando
                                    </a>
                                </nav>
                            </div>
                        </div>

                        <div class="nav-item">
                            <a class="nav-link collapsed @if(isset($menu) && $menu == 'generate') active @endif"
                               data-bs-toggle="collapse" href="#generate"
                               aria-expanded="false" aria-controls="generate">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-filter"></i>
                                </div>
                                Filtrar Estrutura
                                <div class="sb-sidenav-collapse-arrow">
                                    <i class="fas fa-angle-down"></i>
                                </div>
                            </a>
                            <div class="collapse" id="generate">
                                <nav class="sb-sidenav-menu-nested nav flex-column">
                                    <a class="nav-link" href="{{ route('structure.geral.view') }}">
                                        <i class="fas fa-globe me-2"></i> Geral
                                    </a>
                                    <a class="nav-link" href="{{ route('structure.specific.view') }}">
                                        <i class="fas fa-layer-group me-2"></i> Específico
                                    </a>
                                </nav>
                            </div>
                        </div>        
                    @endcan

                        <!-- Management -->
                        @can('index-retired')
                        <div class="nav-item">
                            <a class="nav-link collapsed @if(isset($menu) && $menu == 'retired') active @endif"
                               data-bs-toggle="collapse" href="#collapseretired"
                               aria-expanded="false" aria-controls="collapseretired">
                                <div class="sb-nav-link-icon">
                                    <i class="fas fa-user-shield"></i>
                                </div>
                                Gestão
                                <div class="sb-sidenav-collapse-arrow">
                                    <i class="fas fa-angle-down"></i>
                                </div>
                            </a>
                            <div class="collapse" id="collapseretired">
                                <nav class="sb-sidenav-menu-nested nav flex-column">
                                    <a class="nav-link" href="{{ route('retired.index') }}">
                                        <i class="fas fa-person-military-rifle me-2"></i> Reformados
                                    </a>
                                    <a class="nav-link" href="{{ route('birthdate') }}">
                                        <i class="fas fa-birthday-cake me-2"></i> Aniversariantes
                                    </a>
                                </nav>
                            </div>
                        </div>
                        @endcan

                        <!-- Roles -->
                        @can('index-role')
                        <a @class(['nav-link', 'active' => isset($menu) && $menu == 'roles']) href="{{ route('role.index') }}">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-network-wired"></i>
                            </div>
                            Papéis
                        </a>
                        @endcan

                        <!-- Logout -->
                        <a class="nav-link text-danger" href="{{ route('login.destroy') }}">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-sign-out-alt"></i>
                            </div>
                            Sair
                        </a>
                    </div>
                </div>

                <!-- Sidebar Footer -->
                <div class="sb-sidenav-footer bg-light text-dark">
                    <div class="small fw-bold">
                        <i class="fas fa-user-circle me-1"></i>
                        @auth
                            {{ auth()->user()->name }}
                        @endauth
                    </div>
                </div>
            </nav>
        </div>

        <!-- Main Content -->
        <div id="layoutSidenav_content">
            <main class="pt-0 px-4">
                @yield('content')
            </main>

            <!-- Footer -->
            <footer class="py-3 bg-white shadow-sm mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">
                            <i class="fas fa-copyright me-1"></i> DI/EXE {{ date('Y') }}
                        </div>
                        <div class="text-muted">
                            <span class="badge bg-sucess">v1.0.0</span>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.min.js"></script>


</body>

</html>
