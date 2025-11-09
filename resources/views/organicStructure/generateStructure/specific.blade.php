@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4 mt-4">
        <!-- Cabeçalho e Breadcrumb -->
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4">
            <h2 class="mb-3 mb-md-0">
                <i class="fas fa-sitemap text-dark me-2"></i>Estrutura Orgânica - Específica
            </h2>

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                            <i class="fas fa-home me-1"></i> Dashboard
                        </a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <i class="fas fa-sitemap me-1"></i> Estrutura Específica
                    </li>
                </ol>
            </nav>
        </div>

        <hr class="mt-2 mb-3">

        <!-- Card Principal -->
        <div class="card border-0 shadow-sm mb-4">
            <div class="card-header bg-nav d-flex flex-column flex-md-row align-items-start align-items-md-center">
                <h5 class="mb-2 mb-md-0 text-white">
                    <i class="fas fa-filter  me-2"></i>Filtrar Estrutura
                </h5>
                <div class="ms-md-auto">
                    @can('create-structure')
                        <a href="{{ route('structure.geral.view') }}" class="btn btn-light btn-sm text-dark">
                            <i class="fas fa-eye me-1"></i> Ver Estrutura Geral
                        </a>
                    @endcan
                </div>
            </div>

            <div class="card-body">
                <!-- Formulário de Filtro -->
                <form action="{{ route('structure.specific') }}" method="POST" class="row g-3">
                    @csrf
                    <!-- Região -->
                    <div class="col-md-3">
                        <label for="id_regiao" class="form-label">
                            <i class="fas fa-map-marked-alt me-1"></i> Região
                        </label>
                        <select class="form-select form-select-sm" id="id_regiao" name="id_regiao">
                            <option value="">Selecione uma região</option>
                            @foreach ($regioes as $regiao)
                                <option value="{{ $regiao->id_regiao }}"
                                    {{ old('id_regiao', $selected_regiao ?? '') == $regiao->id_regiao ? 'selected' : '' }}>
                                    {{ $regiao->nome_regiao }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- UEO -->
                    <div class="col-md-3">
                        <label for="id_pai" class="form-label">
                            <i class="fas fa-building me-1"></i> UEO
                        </label>
                        <select name="ueo" id="id_pai" class="form-select form-select-sm">
                            <option value="">Selecione uma UEO</option>
                            @foreach ($ueos as $ueo)
                                <option value="{{ $ueo->id_unidade_pai }}"
                                    {{ old('ueo', $selected_ueo ?? '') == $ueo->id_unidade_pai ? 'selected' : '' }}>
                                    {{ $ueo->Ueo }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Subunidade -->
                    <div class="col-md-3">
                        <label for="subunidade" class="form-label">
                            <i class="fas fa-layer-group me-1"></i> Subunidade
                        </label>
                        <select name="subunidade" id="subunidade" class="form-select form-select-sm">
                            <option value="">Selecione uma subunidade</option>
                            @foreach ($subunidades as $sub)
                                <option value="{{ $sub->id_es }}"
                                    {{ old('subunidade', $selected_subunidade ?? '') == $sub->id_es ? 'selected' : '' }}>
                                    {{ $sub->descricao_sub_unidade }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Filtro de Cargos -->
                    <div class="col-md-2">
                        <label for="filtrar_cargos" class="form-label ">
                            <i class="fas fa-user-tie me-1"></i> Filtrar Cargos
                        </label>
                        <select name="filtrar_cargos" id="filtrar_cargos" class="form-select form-select-sm">
                            <option value="1" {{ old('filtrar_cargos', $selected_cargos ?? 1) == 1 ? 'selected' : '' }}>Todos</option>
                            <option value="2" {{ old('filtrar_cargos', $selected_cargos ?? '') == 2 ? 'selected' : '' }}>Ocupados</option>
                            <option value="3" {{ old('filtrar_cargos', $selected_cargos ?? '') == 3 ? 'selected' : '' }}>Vagos</option>
                        </select>
                    </div>

                    <!-- Botão de Submit -->
                    <div class="col-md-1 d-flex align-items-end">
                        <button type="submit" class="btn btn-sm btn-warning w-90">
                            <i class="fas fa-search me-1"></i> Filtrar
                        </button>
                    </div>
                </form>

                <!-- Tabela de Resultados -->
                @isset($estrutura)
                    <div class="table-responsive mt-4">
                        <table class="table table-sm table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th class="py-2"><i class="fas fa-user-tie me-1 text-secondary"></i> Cargo</th>
                                    <th class="py-2"><i class="fas fa-star me-1 text-secondary"></i> Posto Orgânico</th>
                                    <th class="py-2"><i class="fas fa-user me-1 text-secondary"></i> Pessoa no cargo</th>
                                    <th class="py-2"><i class="fas fa-hashtag me-1 text-secondary"></i> QTD</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($estrutura as $item)
                                    <tr>
                                        <td>{{ $item->nome_cargo }}</td>
                                        <td>{{ $item->Posto }}</td>
                                        <td>
                                            @if (!is_null($item->nome))
                                                <span class="">{{ $item->patente }}. {{ $item->nome }}</span>
                                            @else
                                                <span class="badge bg-secondary bg-opacity-10 text-secondary">Vago</span>
                                            @endif
                                        </td>
                                        <td>{{ $item->quantidade_organica }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endisset
            </div>
        </div>
    </div>
@endsection
