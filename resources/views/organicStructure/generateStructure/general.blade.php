@extends('layouts.admin')

@section('content')
    <div class="container-fluid py-4 structure-container">
        <!-- Cabeçalho e Breadcrumb -->
        <div class="mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fas fa-sitemap me-2 text-dark"></i> Estrutura Orgânica</h2>

                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                                <i class="fas fa-home me-1"></i> Dashboard
                            </a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <i class="fas fa-sitemap me-1"></i> Estrutura Orgânica
                        </li>
                    </ol>
                </nav>
            </div>
            <hr class="mt-2 mb-3">
        </div>

        <!-- Card Principal -->
        <div class="card mb-4 structure-card">
            <div
                class="card-headerbg-nav bg-nav d-flex flex-column flex-md-row align-items-start align-items-md-center p-2">
                <h5 class="mb-2 mb-md-0 text-white"><i class="fas fa-filter me-2"></i>Filtrar Estrutura Geral</h5>
                <div class="ms-auto">
                    @can('create-structure')
                        <a href="{{ route('structure.specific.view') }}" class="btn btn-light btn-sm text-dark">
                            <i class="fas fa-eye me-1"></i> Ver Estrutura Específica
                        </a>
                    @endcan
                </div>
            </div>

            <div class="card-body">
                <!-- Formulário de Filtro -->
                <form method="POST" action="{{ route('structure.geral') }}">
                    @csrf
                    <div class="row g-3">
                        <!-- Ramo -->
                        <div class="form-group col-md-3">
                            <label for="ramo" class="form-label">
                                <i class="fas fa-flag me-1"></i> Ramo <span class="text-danger">*</span>
                            </label>
                            <select class="form-select" id="ramo" name="ramo">
                                <option value="">Selecione um ramo</option>
                                @foreach ($ramos as $ramo)
                                    <option value="{{ $ramo->RamoID }}"
                                        {{ old('ramo', request('ramo')) == $ramo->RamoID ? 'selected' : '' }}>
                                        {{ $ramo->DescRamo }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Região -->
                        <div class="form-group col-md-3">
                            <label for="id_regiao" class="form-label" id="label-regiao">
                                <i class="fas fa-map-marker-alt me-2"></i>Região <span class="text-danger">*</span>
                            </label>
                            <select name="id_regiao" id="id_regiao" class="form-select">
                                <option value="">Selecione uma região</option>
                                @foreach ($regioes as $regiao)
                                    @if (request('ramo') == $regiao->RamoID)
                                        <option value="{{ $regiao->id_regiao }}"
                                            {{ old('id_regiao', request('id_regiao')) == $regiao->id_regiao ? 'selected' : '' }}>
                                            {{ $regiao->nome_regiao }}
                                        </option>
                                    @endif
                                @endforeach
                            </select>
                        </div>

                        <!-- Unidade -->
                        <div class="form-group col-md-3">
                            <label for="unidade" class="form-label">
                                <i class="fas fa-building me-1"></i> UEO
                            </label>
                            <select name="unidade" id="unidade" class="form-select">
                                <option value="">Selecione uma unidade</option>
                                @foreach ($ueos as $ueo)
                                    @if (request('id_regiao') == $ueo->RM)
                                        <option value="{{ $ueo->id_unidade_pai }}"
                                            {{ old('unidade', request('unidade')) == $ueo->id_unidade_pai ? 'selected' : '' }}>
                                            {{ $ueo->Ueo }}
                                        </option>
                                    @endif
                                @endforeach
                            </select>

                        </div>


                        <!-- Filtro -->
                        <div class="form-group col-md-2">
                            <label for="filtro" class="form-label">
                                <i class="fas fa-filter me-1"></i> Filtrar Cargos
                            </label>
                            <select name="filtro" id="filtro" class="form-select">
                                <option value="1" {{ old('filtro', request('filtro')) == 1 ? 'selected' : '' }}>Todos
                                </option>
                                <option value="2" {{ old('filtro', request('filtro')) == 2 ? 'selected' : '' }}>
                                    Ocupados</option>
                                <option value="3" {{ old('filtro', request('filtro')) == 3 ? 'selected' : '' }}>Vagos
                                </option>
                            </select>
                        </div>

                        <!-- Botão -->
                        <div class="form-group col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-md btn-warning w-50">
                                <i class="fas fa-search me-1"></i> Filtrar
                            </button>
                        </div>
                    </div>
                </form>


                <!-- Tabela de Resultados -->
                @isset($estrutura)
                    <div class="table-responsive mt-4">
                        <table class="table table-striped table-hover structure-table">
                            <thead class="table-light">
                                <tr>
                                    <th><i class="fas fa-list-alt me-1"></i> Denominação</th>
                                    <th><i class="fas fa-user-tie me-1"></i> Cargo</th>
                                    <th><i class="fas fa-star me-1"></i> Posto Orgânico</th>
                                    <th><i class="fas fa-user me-1"></i> Pessoa no Cargo</th>
                                    <th><i class="fas fa-hashtag me-1"></i> QTD</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($estrutura as $item)
                                    <tr>
                                        <td class="fw-semibold">{{ $item->descricao_sub_unidade }}</td>
                                        <td>{{ $item->nome_cargo }}</td>
                                        <td>{{ $item->Posto }}</td>
                                        <td>
                                            @if (!is_null($item->nome))
                                                {{ $item->patente }}. {{ $item->nome }}
                                            @else
                                                <span class="text-muted">Vago</span>
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
