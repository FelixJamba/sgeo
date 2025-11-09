@extends('layouts.admin')

@section('content')
<div class="container-fluid py-4">
    <div class="mb-1 hstack gap-2">
        <h2 class="mt-3"><i class="fas fa-sitemap me-2"></i>Estrutura Orgânica</h2>
        <ol class="breadcrumb mb-3 mt-3 ms-auto">
            <li class="breadcrumb-item">
                <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                    <i class="fas fa-home me-1"></i> Dashboard
                </a>
            </li>
            <li class="breadcrumb-item active">
                <i class="fas fa-sitemap me-1"></i> Estrutura Orgânica
            </li>
        </ol>
    </div>

     <hr class="mt-2 mb-3">


    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header bg-nav text-white">
            <h5 class="mb-0"><i class="fas fa-network-wired me-2"></i>Cadeia de Comando EXE</h5>
        </div>

        <div class="card-body p-0">
            @if(empty($regioes))
                <div class="alert alert-danger m-3">
                    <i class="fas fa-exclamation-circle me-2"></i> Nenhuma estrutura foi encontrada!
                </div>
            @else
                <div class="accordion accordion-flush" id="cadeiaComandoAccordion">
                    @foreach ($regioes as $regiao)
                    <div class="accordion-item border-0">
                        <!-- Região (Sempre visível) -->
                        <div class="accordion-header bg-light">
                            <div class="d-flex justify-content-between align-items-center p-3">
                                <h6 class="mb-0 fw-bold">
                                    <i class="fas fa-map-marker-alt text-warning me-2"></i>
                                    {{ $regiao->regiao }}
                                </h6>
                                <span class="badge bg-success rounded-pill">
                                    {{ count($regiao->unidades) }} Unidades
                                </span>
                            </div>
                        </div>

                        <!-- Unidades (Expandíveis) -->
                        <div class="accordion-collapse collapse show">
                            <div class="accordion-body p-0">
                                @foreach ($regiao->unidades as $unidade)
                                <div class="accordion accordion-flush" id="unidadeAccordion{{ $loop->parent->index }}{{ $loop->index }}">
                                    <div class="accordion-item border-0 border-bottom">
                                        <h6 class="accordion-header">
                                            <button class="accordion-button collapsed bg-white py-2" type="button"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#unidadeCollapse{{ $loop->parent->index }}{{ $loop->index }}"
                                                    aria-expanded="false">
                                                <i class="fas fa-building me-2 text-muted"></i>
                                                {{ $unidade->ueo }}
                                                @if(!empty($unidade->cargos))
                                                <span class="badge bg-secondary ms-2 rounded-pill">
                                                    {{ count($unidade->cargos) }} Cargos
                                                </span>
                                                @endif
                                            </button>
                                        </h6>
                                        <div id="unidadeCollapse{{ $loop->parent->index }}{{ $loop->index }}"
                                             class="accordion-collapse collapse"
                                             data-bs-parent="#unidadeAccordion{{ $loop->parent->index }}{{ $loop->index }}">
                                            <div class="accordion-body pt-0 pb-3">
                                                @if(!empty($unidade->cargos))
                                                <div class="list-group list-group-flush">
                                                    @foreach ($unidade->cargos as $cargo)
                                                    <div class="list-group-item border-0 px-0 py-2">
                                                        <div class="d-flex align-items-start">
                                                            <span class="badge bg-success rounded-circle me-2 mt-1">{{ $loop->iteration }}</span>
                                                            <div>
                                                                <strong class="d-block">{{ $cargo->cargo_ueo }}</strong>
                                                                <small class="text-muted">
                                                                    <i class="fas fa-user me-1"></i> {{ $cargo->ocupante ?? 'Vago' }}
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endforeach
                                                </div>
                                                @else
                                                <div class="alert alert-warning mb-0">
                                                    <i class="fas fa-info-circle me-2"></i> Nenhum cargo definido para esta estrutura orgânica
                                                </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            @endif
        </div>
    </div>
</div>
@endsection


