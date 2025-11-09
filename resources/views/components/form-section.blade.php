@props([
    'headers' => [],        // lista dos títulos das colunas
    'scrollHeight' => '300px', // altura máxima da área rolável
])

<div class="form-section-container card p-3 border-dark">

    <!-- Cabeçalho fixo -->
    <div class="row fw-semibold border-bottom pb-2 mb-2 text-black sticky-header bg-light">
        @foreach ($headers as $header)
            <div class="col">{{ $header }}</div>
        @endforeach
    </div>

    <!-- Conteúdo rolável -->
    <div class="scrollable-container" style="max-height: {{ $scrollHeight }}; overflow-y: auto;">
        {{ $slot }}
    </div>

</div>
