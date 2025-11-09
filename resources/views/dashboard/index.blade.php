@extends('layouts.admin')

@section('content')
<div class="container-fluid px-4">
    <!-- Cabeçalho -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="mt-3">
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard SIGEEO
        </h1>
        <div class="breadcrumb">
    <span class="text-muted">
        <i class="fas fa-calendar-alt me-1"></i> 
        <span id="relogio"></span>
    </span>
</div>

    </div>

    <hr class="mb-0 mb-3">

    <!-- Cards de Resumo -->
    <div class="row mb-4">
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-start-primary border-3 shadow-sm h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs fw-bold text-primary text-uppercase mb-1">
                                Total de Especialistas
                            </div>
                            <div class="h5 mb-0 fw-bold">{{ $totalEspecialistas }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-start-info border-3 shadow-sm h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs fw-bold text-info text-uppercase mb-1">
                                Cargos Ocupados
                            </div>
                            <div class="h5 mb-0 fw-bold">{{ $cargosOcupados }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user-tie fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-start-warning border-3 shadow-sm h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col me-2">
                            <div class="text-xs fw-bold text-warning text-uppercase mb-1">
                                Cargos Vagos
                            </div>
                            <div class="h5 mb-0 fw-bold">{{ $cargosVagos }}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user-slash fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Gráficos -->
    <div class="row">
        <!-- Gráfico por Região -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white d-flex justify-content-between">
                    <span><i class="fas fa-map-marked-alt me-2"></i>Especialistas por Região</span>
                    <button class="btn btn-sm btn-light" onclick="toggleChartType('graficoPorRegiao')">
                        <i class="fas fa-exchange-alt"></i>
                    </button>
                </div>
                <div class="card-body">
                    <canvas id="graficoPorRegiao" height="300"></canvas>
                </div>
            </div>
        </div>

        <!-- Gráfico por Posto -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white d-flex justify-content-between">
                    <span><i class="fas fa-chess-queen me-2"></i>Especialistas por Posto</span>
                    <button class="btn btn-sm btn-light" onclick="toggleChartType('graficoPorPosto')">
                        <i class="fas fa-exchange-alt"></i>
                    </button>
                </div>
                <div class="card-body">
                    <canvas id="graficoPorPosto" height="300"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Atividades Recentes -->
    <!--
    <div class="row">
        <div class="col-lg-12 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-dark text-white">
                    <i class="fas fa-history me-2"></i>Atividades Recentes
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Data/Hora</th>
                                    <th>Usuário</th>
                                    <th>Ação</th>
                                    <th>Detalhes</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

      function atualizarHora() {
        const agora = new Date();
        const dia = String(agora.getDate()).padStart(2, '0');
        const mes = String(agora.getMonth() + 1).padStart(2, '0');
        const ano = agora.getFullYear();
        const horas = String(agora.getHours()).padStart(2, '0');
        const minutos = String(agora.getMinutes()).padStart(2, '0');
        const segundos = String(agora.getSeconds()).padStart(2, '0');
        
        document.getElementById('relogio').innerText = `${dia}/${mes}/${ano} ${horas}:${minutos}:${segundos}`;
    }

    // Atualiza já na carga
    atualizarHora();
    // E depois de 1 em 1 segundo
    setInterval(atualizarHora, 1000);


    // Cores para os gráficos
    const colorPalette = [
        '#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b',
        '#858796', '#5a5c69', '#3a3b45', '#2e59d9', '#17a673',
        '#2c9faf', '#dda20a', '#be2617', '#6c757d', '#5a6268'
    ];

    // Gráfico por Região
    const regiaoLabels = @json($chartRegiao['labels']);
    const regiaoData = @json($chartRegiao['data']);
    const regiaoColors = Array.from({length: regiaoLabels.length}, (_, i) => colorPalette[i % colorPalette.length]);

    const ctxRegiao = document.getElementById('graficoPorRegiao').getContext('2d');
    const graficoPorRegiao = new Chart(ctxRegiao, {
        type: 'bar',
        data: {
            labels: regiaoLabels,
            datasets: [{
                label: 'Quantidade de Especialistas',
                data: regiaoData,
                backgroundColor: regiaoColors,
                borderColor: regiaoColors.map(c => c.replace('0.6', '1')),
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return `${context.dataset.label}: ${context.raw}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Quantidade' }
                },
                x: {
                    title: { display: true, text: '' }
                }
            }
        }
    });

    // Gráfico por Posto
    const postoLabels = @json($chartPosto['labels']);
    const postoData = @json($chartPosto['data']);
    const postoColors = Array.from({length: postoLabels.length}, (_, i) => colorPalette[i % colorPalette.length]);

    const ctxPosto = document.getElementById('graficoPorPosto').getContext('2d');
    const graficoPorPosto = new Chart(ctxPosto, {
        type: 'bar',
        data: {
            labels: postoLabels,
            datasets: [{
                label: 'Quantidade de Especialistas',
                data: postoData,
                backgroundColor: postoColors,
                borderColor: postoColors.map(c => c.replace('0.6', '1')),
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            return `${context.dataset.label}: ${context.raw}`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: { display: true, text: 'Quantidade' }
                },
                x: {
                    title: { display: true, text: 'Postos' }
                }
            }
        }
    });

    // Alternar entre gráfico de barras e pizza
    function toggleChartType(chartId) {
        const chart = chartId === 'graficoPorRegiao' ? graficoPorRegiao : graficoPorPosto;
        chart.config.type = chart.config.type === 'bar' ? 'pie' : 'bar';

        if(chart.config.type === 'pie') {
            chart.options = {
                responsive: true,
                plugins: {
                    legend: { position: 'right' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                const percentage = Math.round((value / total) * 100);
                                return `${label}: ${value} (${percentage}%)`;
                            }
                        }
                    }
                }
            };
        } else {
            chart.options = {
                responsive: true,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return `${context.dataset.label}: ${context.raw}`;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: { display: true, text: 'Quantidade' }
                    },
                    x: {
                        title: {
                            display: true,
                            text: chartId === 'graficoPorRegiao' ? '' : 'Postos'
                        }
                    }
                }
            };
        }
        chart.update();
    }

  
</script>
@endsection
