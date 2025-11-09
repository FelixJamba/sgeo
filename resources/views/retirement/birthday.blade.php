@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <!-- Cabeçalho -->
        <div class="mb-1 hstack gap-2">
            <h2 class="mt-3">Aniversariantes</h2>

            <ol class="breadcrumb mb-3 mt-3 ms-auto">
                <li class="breadcrumb-item">
                    <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                        <i class="fas fa-home me-1"></i>Dashboard
                    </a>
                </li>
                <li class="breadcrumb-item active">Aniversariantes</li>
            </ol>
        </div>

        <hr class="mt-2 mb-3">

        <!-- Card Principal -->
        <div class="card mb-4 border-light shadow" style="min-width: 100px;">
            <!-- Cabeçalho do Card -->
            <div class="card-header bg-nav text-white rounded-top-3">
                <h5 class="card-title text-center mb-0">Aniversariantes do Mês</h5>
            </div>

            <!-- Corpo do Card -->
            <div class="card-body p-2">
                <!-- Filtro por Mês -->
                <form method="GET" action="{{ route('birthdate') }}" class="mb-3">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-4">
                            <label for="mes" class="form-label">Selecione o mês:</label>
                            <select name="mes" id="mes" class="form-select">
                                @foreach(range(1, 12) as $month)
                                    <option value="{{ $month }}" {{ $mes == $month ? 'selected' : '' }}>
                                        {{ \Carbon\Carbon::createFromFormat('m', $month)->locale('pt_BR')->monthName }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-warning w-100">
                                <i class="fas fa-filter me-1"></i> Filtrar
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Tabela de Resultados -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered table-sm-font align-middle">
                        <thead class="table-light">
                            <tr>
                                <th class="text-nowrap">Posto</th>
                                <th class="text-nowrap">NIP</th>
                                <th>Nome</th>
                                <th class="text-nowrap">Idade</th>
                                <th class="text-nowrap">Data de Nascimento</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($aniversariantes as $aniversariante)
                                <tr>
                                    <td>{{ $aniversariante->PostoAbrev }}</td>
                                    <td>{{ $aniversariante->nip }}</td>
                                    <td>{{ $aniversariante->nome }}</td>
                                    <td>{{ $aniversariante->idade }} anos</td>
                                    <td>{{ $aniversariante->Data_Nascimento }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center py-3 text-muted">
                                        <i class="fas fa-birthday-cake me-2"></i> Nenhum aniversariante encontrado para este mês.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <!-- Paginação -->
                    @if($aniversariantes->hasPages())
                        <div class="d-flex justify-content-center mt-3">
                            {{ $aniversariantes->links() }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
