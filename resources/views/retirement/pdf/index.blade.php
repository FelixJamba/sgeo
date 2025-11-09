<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{{ strtoupper($title) }}</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; text-transform: uppercase; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h1, .header h2 { font-size: 18px; margin: 3px 0; }
        .info { margin-bottom: 15px; }
        table { width: 100%; border-collapse: collapse; font-size: 13px; }
        table, th, td { border: 1px solid #000; }
        th, td { padding: 5px; text-align: left; }
        th { background-color: #f2f2f2; }
        .footer { margin-top: 20px; text-align: right; font-size: 12px; }

        /* Assinatura */
        .signature {
            margin-top: 80px;
            text-align: center;
            font-size: 14px;
            line-height: 1.8;
        }

        .signature .line {
            margin: 15px auto 5px;
            width: 250px;
            border-top: 1px solid #000;
        }

        .signature p {
            margin: 5px 0;
        }

        img.logo {
            width: 80px;
            height: auto;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
       <div class="info">
            <img src="{{ public_path('images/exercito.png') }}" alt="Logotipo" class="logo">
            <h1>FORÇAS ARMADAS ANGOLANAS</h1>
            <h2>COMANDO DO EXÉRCITO</h2>
            <h1>LISTA DE MILITARES A REFORMAR - {{ $anoFiltro }}</h1>
       </div>
        <div class="info">
            <p>FILTRO APLICADO: {{ $filtro == 'idade' ? 'LIMITE DE IDADE' : 'TSM' }}</p>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>POSTO</th>
                <th>NIP</th>
                <th>NOME</th>
                <th>IDADE</th>
                <th>TEMPO DE SERVIÇO</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($query as $reformado)
                <tr>
                    <td>{{ strtoupper($reformado->posto) }}</td>
                    <td>{{ $reformado->nip }}</td>
                    <td>{{ strtoupper($reformado->nome) }}</td>
                    <td>{{ $reformado->idade_atual }} ANOS</td>
                    <td>{{ $reformado->tempo_servico }} ANOS</td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align:center;">NENHUM MILITAR REFORMADO ENCONTRADO PARA O ANO {{ $anoFiltro }}.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Assinatura -->
    <div class="signature">
        <p>O CHEFE DA DIRECÇÃO</p>
        <div class="line"></div>
        <p><strong>RUFINO MANUEL CRISTÓVÃO</strong></p>
        <p>BRIGADEIRO</p>
    </div>

    <div class="footer">
        DI/EXE - {{ strtoupper(config('app.name')) }}
    </div>
</body>
</html>
