@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <!-- Cabeçalho -->
        <div class="mb-1 hstack gap-2">
            <h2 class="mt-3">Militares a Reformar</h2>

            <ol class="breadcrumb mb-3 mt-3 ms-auto">
                <li class="breadcrumb-item">
                    <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                        <i class="fas fa-home me-1"></i>Dashboard
                    </a>
                </li>
                <li class="breadcrumb-item active">Reformados</li>
            </ol>
        </div>

        <hr class="mt-2 mb-3">

        <!-- Card Principal -->
        <div class="card mb-4 border-light shadow">
            <!-- Cabeçalho do Card -->
            <div class="card-header bg-nav text-white">
                <h5 class="card-title text-center mb-0">Militares a serem Reformados</h5>
            </div>

            <!-- Corpo do Card -->
            <div class="card-body p-3">
                <div class="table-responsive">
                    <!-- Formulário de Filtro -->
                    <form method="GET" action="{{ route('retired.index') }}" class="mb-4">
                        <div class="row g-3 align-items-end">
                            <!-- Campo Ano -->
                            <div class="col-md-3 col-sm-6">
                                <label for="year-select" class="form-label">Escolha o ano:</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                    <input type="number" id="year-select" name="ano"
                                           class="form-control"
                                           placeholder="Digite o ano"
                                           min="1900" max="9999"
                                           value="{{ request('ano', date('Y')) }}" required>
                                </div>
                            </div>

                            <!-- Opções de Filtro -->
                            <div class="col-md-4 col-sm-6">
                                <label class="form-label d-block">Filtrar Por:</label>
                                <div class="btn-group" role="group">
                                    <input type="radio" class="btn-check" name="filtro" id="idade"
                                           value="idade" autocomplete="off"
                                           {{ request('filtro', 'idade') == 'idade' ? 'checked' : '' }}>
                                    <label class="btn btn-outline-success" for="idade">
                                        <i class="fas fa-user-clock me-1"></i> Limite de Idade
                                    </label>

                                    <input type="radio" class="btn-check" name="filtro" id="tsm"
                                           value="tsm" autocomplete="off"
                                           {{ request('filtro') == 'tsm' ? 'checked' : '' }}>
                                    <label class="btn btn-outline-success" for="tsm">
                                        <i class="fas fa-clock me-1"></i> TSM
                                    </label>
                                </div>
                            </div>

                            <!-- Botões de Ação -->
                            <div class="col-md-5 col-sm-12">
                                <div class="d-flex gap-2 justify-content-end">
                                    <button type="submit" class="btn btn-warning flex-grow-1 flex-md-grow-0">
                                        <i class="fas fa-search me-1"></i> Filtrar
                                    </button>

                                    <a href="{{ route('retired.pdf', ['ano' => request('ano', date('Y')), 'filtro' => request('filtro', 'idade')]) }}"
                                       class="btn btn-danger flex-grow-1 flex-md-grow-0" target="_blank">
                                        <i class="fas fa-file-pdf me-1"></i> Gerar PDF
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Tabela de Resultados -->
                    <table class="table table-striped table-hover table-bordered align-middle" id="table-reformados">
                        <thead class="table-light">
                            <tr class="text-dark">
                                <th class="text-nowrap">Posto</th>
                                <th class="text-nowrap">NIP</th>
                                <th class="d-none d-sm-table-cell">Nome</th>
                                <th class="d-none d-sm-table-cell">Idade</th>
                                <th class="d-none d-sm-table-cell">Tempo Serviço</th>
                                <th class="d-none d-sm-table-cell">Ano de Saída</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($query as $reformado)
                                <tr>
                                    <td>{{ $reformado->posto }}</td>
                                    <td>{{ $reformado->nip }}</td>
                                    <td class="d-none d-sm-table-cell">{{ $reformado->nome }}</td>
                                    <td class="d-none d-sm-table-cell">
                                        <span class="badge bg-success">{{ $reformado->idade_atual }} anos</span>
                                    </td>
                                    <td class="d-none d-sm-table-cell">
                                        <span class="badge bg-success">{{ $reformado->tempo_servico }} anos</span>
                                    </td>
                                    <td class="d-none d-sm-table-cell">
                                        <span class="badge bg-success">{{ $reformado->Data_Saida }}</span>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center py-3 text-muted">
                                        <i class="fas fa-exclamation-circle me-2"></i>
                                        Nenhum militar reformado encontrado para o ano {{ $anoFiltro }} com filtro por
                                        {{ $filtro == 'idade' ? 'limite de idade' : 'TSM' }}.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <!-- Paginação -->
                        <div class="d-flex justify-content-center mt-3">
                            {{ $query->links() }}
                        </div>
                </div>
            </div>
        </div>
    </div>
@endsection
