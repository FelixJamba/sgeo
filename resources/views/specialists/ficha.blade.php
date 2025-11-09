<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="utf-8">
    <title>{{ strtoupper($title) }}</title>
    <style>
    .header {
        text-align: center;
        margin-bottom: 10px;
    }

    .header img.logo {
        width: 90px;
        margin-bottom: 5px;
    }

    .header h1,
    .header h2,
    .header h3 {
        margin: 3px 0;
        text-transform: uppercase;
        line-height: 1.2;
    }

    .header h1 { font-size: 18px; }
    .header h2 { font-size: 16px; }
    .header h3 { font-size: 15px; font-weight: bold; margin-top: 8px; }

    .foto-container {
        text-align: left;
        margin-top: 15px;
        margin-left: 30px;
    }

    .profile-img {
        width: 120px;
        height: 120px;
        /*border-radius: 100%;*/
        object-fit: cover;
        border: 2px solid #635f5fff;
    }

        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 40px;
            color: #000;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header img {
            width: 90px;
        }

        .header h1,
        .header h2 {
            margin: 3px 0;
            text-transform: uppercase;
        }

        .section-title {
            background: #e0e0e0;
            padding: 6px;
            font-weight: bold;
            text-transform: uppercase;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 8px;
            font-size: 13px;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 5px;
            text-align: left;
        }

        th {
            background: #f0f0f0;
            font-weight: bold;
        }

        .no-print {
            text-align: right;
            margin-bottom: 10px;
        }

        @media print {
            .no-print {
                display: none;
            }

            body {
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
        }
    </style>
</head>

<body>
    <div class="no-print">
        <button onclick="window.print()"
            style="padding:6px 12px; background:#0d6efd; color:#fff; border:none; border-radius:4px;">🖨️
            Imprimir</button>
    </div>

    <div class="header">
        <img src="{{ asset('images/exercito.png') }}" alt="Logotipo" class="logo">
        <h1>FORÇAS ARMADAS ANGOLANAS</h1>
        <h2>COMANDO DO EXÉRCITO</h2>
        <h3>FICHA INDIVIDUAL DO ESPECIALISTA</h3>
    </div>

    <div class="foto-container">
        <img class="profile-img" src="{{ asset('storage/' . ($especialista->foto_militar ?? 'fotos/semimagem.jpg')) }}"
            alt="Foto do Especialista">
    </div>



    {{-- =====================
         DADOS PESSOAIS
    ====================== --}}
    <div class="section-title">Dados Pessoais</div>
    <table>
        <tr>
            <th>Nome</th>
            <td>{{ $especialista->nome }}</td>
            <th>NIP</th>
            <td>{{ $especialista->nip }}</td>
        </tr>
        <tr>
            <th>Posto</th>
            <td>{{ $especialista->posto }}</td>
            <th>Cargo</th>
            <td>{{ $especialista->cargo }}</td>
        </tr>
        <tr>
            <th>Naturalidade</th>
            <td>{{ $especialista->naturalidade }}</td>
            <th>Estado Civil</th>
            <td>{{ $especialista->estado_civil }}</td> 
        </tr>
        <tr>
            <th>Idade</th>
            <td>{{ $especialista->idade }} anos</td>
            <th>Grupo Sanguíneo</th>
            <td>{{ $especialista->Tipo_Sanguinio }}</td>
        </tr>
        <tr>
            <th>Especialidade</th>
            <td>{{ $especialista->especialidade }}</td>
            <th>Quadro Especial</th>
            <td>{{ $especialista->Classe }}</td>
        </tr>
      
    </table>

    {{-- =====================
         DOCUMENTOS
    ====================== --}}
    <div class="section-title">Documentos</div>
    <table>
        <tr>
            <th>Tipo</th>
            <th>Número</th>
            <th>Emissão</th>
            <th>Validade</th>
        </tr>
        @foreach ($docs as $doc)
            <tr>
                <td>{{ $doc->nome_doc }}</td>
                <td>{{ $doc->numero_doc }}</td>
                <td>{{ $doc->data_emissao }}</td>
                <td>{{ $doc->data_validade }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         CONTACTOS
    ====================== --}}
    <div class="section-title">Contactos</div>
    <table>
        <tr>
            <th>Tipo</th>
            <th>Contacto</th>
        </tr>
        @foreach ($contactos as $c)
            <tr>
                <td>{{ $c->tipoContacto }}</td>
                <td>{{ $c->Contacto }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         INCORPORAÇÃO
    ====================== --}}
    <div class="section-title">Incorporação</div>
    <table>
        <tr>
            <th>Tipo</th>
            <th>Local</th>
            <th>Data</th>
        </tr>
        @foreach ($incorporacoes as $i)
            <tr>
                <td>{{ $i->nome }}</td>
                <td>{{ $i->provincia }}</td>
                <td>{{ $i->data_incorporacao }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         PROGRESSÕES
    ====================== --}}
    <div class="section-title">Progressões de Posto</div>
    <table>
        <tr>
            <th>Tipo de Ordem</th>
            <th>Referência</th>
            <th>Posto</th>
            <th>Cargo</th>
            <th>Data</th>
        </tr>
        @foreach ($historicoPosto as $h)
            <tr>
                <td>{{ $h->Descricao_tipo_ordem }}</td>
                <td>{{ $h->N_ORDEM }}/{{ $h->Entidade_Abrev }},
                    {{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
                <td>{{ $h->posto_exercido_passado }}</td>
                <td>{{ $h->cargo_exercido }}</td>
                <td>{{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
            </tr>
        @endforeach
    </table>

    <div class="section-title">Progressões de Cargo</div>
    <table>
        <tr>
            <th>Tipo de Ordem</th>
            <th>Referência</th>
            <th>Posto</th>
            <th>Cargo</th>
            <th>Data</th>
        </tr>
        @foreach ($historicoCargo as $h)
            <tr>
                <td>{{ $h->Descricao_tipo_ordem }}</td>
                <td>{{ $h->N_ORDEM }}/{{ $h->Entidade_Abrev }},
                    {{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
                <td>{{ $h->posto_exercido_passado }}</td>
                <td>{{ $h->cargo_exercido }}</td>
                <td>{{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
            </tr>
        @endforeach
    </table>

    <div class="section-title">Outras Progressões</div>
    <table>
        <tr>
            <th>Tipo de Ordem</th>
            <th>Referência</th>
            <th>Posto</th>
            <th>Cargo</th>
            <th>Data</th>
        </tr>
        @foreach ($historicoOutro as $h)
            <tr>
                <td>{{ $h->Descricao_tipo_ordem }}</td>
                <td>{{ $h->N_ORDEM }}/{{ $h->Entidade_Abrev }},
                    {{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
                <td>{{ $h->posto_exercido_passado }}</td>
                <td>{{ $h->cargo_exercido }}</td>
                <td>{{ $h->dia }}/{{ $h->mes }}/{{ $h->ano }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         AGREGAÇÃO
    ====================== --}}
    <div class="section-title">Agregado Familiar</div>
    <table>
        <tr>
            <th>Nome</th>
            <th>Data Nasc.</th>
            <th>Parentesco</th>
            <th>Sexo</th>
            <th>Província</th>
        </tr>
        @foreach ($agregado_familiar as $ag)
            <tr>
                <td>{{ $ag->Nome_Agr }}</td>
                <td>{{ $ag->data_nasc }}</td>
                <td>{{ $ag->Parentesco }}</td>
                <td>{{ $ag->Sexo_Agr }}</td>
                <td>{{ $ag->Provincia }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         LÍNGUAS
    ====================== --}}
    <div class="section-title">Línguas Faladas</div>
    <table>
        <tr>
            <th>Línguas Nacionais</th>
            <th>Línguas Estrangeiras</th>
        </tr>
        <tr>
            <td>{{ $linguasN->pluck('descricaoLingua')->implode(', ') }}</td>
            <td>{{ $linguasE->pluck('descricaoLingua')->implode(', ') }}</td>
        </tr>
    </table>

    {{-- =====================
         FORMAÇÕES
    ====================== --}}
    <div class="section-title">Formações Académicas</div>
    <table>
        <tr>
            <th>Curso</th>
            <th>Nível</th>
            <th>Tipo</th>
            <th>Instituição</th>
            <th>País</th>
            <th>Início</th>
            <th>Fim</th>
            <th>Nota</th>
        </tr>
        @foreach ($formacoes as $f)
            <tr>
                <td>{{ $f->nome_curso }}</td>
                <td>{{ $f->nive_curso }}</td>
                <td>{{ $f->tipo_curso }}</td>
                <td>{{ $f->nome_instituicao }}</td>
                <td>{{ $f->nome_pais }}</td>
                <td>{{ $f->data_inicio }}</td>
                <td>{{ $f->data_fim }}</td>
                <td>{{ $f->nota }}</td>
            </tr>
        @endforeach
    </table>

    {{-- =====================
         REFORMA
    ====================== --}}
    <div class="section-title">Reforma</div>
    <table>
        <tr>
            <th>Tipo</th>
            <th>Valor</th>
        </tr>
        @foreach ($reforma as $r)
            <tr>
                <td>{{ $r['label'] }}</td>
                <td>{{ $r['valor'] }}</td>
            </tr>
        @endforeach
    </table>

    <div style="margin-top:40px; text-align:center; font-size:13px;">
        <p><strong>O Chefe da Direcção</strong></p>
        <div style="width:250px; margin:10px auto; border-top:1px solid #000;"></div>
        <p><strong>RUFINO MANUEL CRISTÓVÃO</strong></p>
        <p><em>BRIGADEIRO</em></p>
    </div>

    <div style="text-align:right; margin-top:20px; font-size:12px;">
        DI/EXE - {{ strtoupper(config('app.name')) }}
    </div>

</body>

</html>
