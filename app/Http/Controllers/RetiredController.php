<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use Barryvdh\DomPDF\Facade\Pdf;
use Response;


class RetiredController extends Controller
{
    public function index(Request $request)
    {
        // Capturar parâmetros do filtro
        $anoFiltro = $request->input('ano', date('Y')); // Ano para filtro
        $anoAtual = date('Y'); // Ano atual
        $filtro = $request->input('filtro', 'idade'); // Padrão: Limite de Idade (corrigido para match com view)

        // Construir query
        $query = DB::table('qry_reformados_nova')
            ->select(
                'PostoAbrev as posto',
                'nip',
                'nome',
                'LIMITE_IDADE',
                'TSM',
                'tempo_servico',
                // Idade atual (ano corrente)
                DB::raw("$anoAtual - YEAR(Data_Nascimento) as idade_atual"),
                // Tempo de serviço atual (ano corrente)
                DB::raw("$anoAtual - YEAR(Data_Incorporacao) as tempo_servico_atual"),
                // Ano de saída conforme filtro
                DB::raw("CASE WHEN '$filtro' = 'idade' THEN LIMITE_IDADE
                  WHEN '$filtro' = 'tsm' THEN TSM
                  ELSE NULL END as Data_Saida")
            )
            ->where(function ($q) use ($anoFiltro, $filtro) {
                if ($filtro == 'idade') {
                    $q->where('LIMITE_IDADE', $anoFiltro);
                } elseif ($filtro == 'tsm') {
                    $q->where('TSM', $anoFiltro);
                }
            })
            ->orderBy('Posto_Id')
            ->paginate(10)
            ->appends($request->query());;

        return view('retirement.index', compact('query', 'anoAtual', 'anoFiltro', 'filtro'));
    }

    public function generatePDF(Request $request)
    {
        // Capturar os mesmos parâmetros do filtro
        $anoFiltro = $request->input('ano', date('Y'));
        $anoAtual = date('Y');
        $filtro = $request->input('filtro', 'idade');

        // Reutilizar a mesma query do método index
        $query = DB::table('qry_reformados_nova')
            ->select(
                'PostoAbrev as posto',
                'nip',
                'nome',
                'LIMITE_IDADE',
                'TSM',
                'tempo_servico',
                DB::raw("$anoAtual - YEAR(Data_Nascimento) as idade_atual"),
                DB::raw("$anoAtual - YEAR(Data_Incorporacao) as tempo_servico_atual"),
                DB::raw("CASE WHEN '$filtro' = 'idade' THEN LIMITE_IDADE
                  WHEN '$filtro' = 'tsm' THEN TSM
                  ELSE NULL END as Data_Saida")
            )
            ->where(function ($q) use ($anoFiltro, $filtro) {
                if ($filtro == 'idade') {
                    $q->where('LIMITE_IDADE', $anoFiltro);
                } elseif ($filtro == 'tsm') {
                    $q->where('TSM', $anoFiltro);
                }
            })
            ->orderBy('Posto_Id')
            ->get();

        $data = [
            'query' => $query,
            'anoFiltro' => $anoFiltro,
            'filtro' => $filtro,
            'title' => 'Lista de Reformados - ' . $anoFiltro
        ];

        $pdf = Pdf::loadView('retirement.pdf.index', $data);

        // Opção 1: Baixar o PDF
        // return $pdf->download('reformados-'.$anoFiltro.'.pdf');

        // Opção 2: Abrir no navegador
        return $pdf->stream('reformados-' . $anoFiltro . '.pdf');
    }



    public function birthdate(Request $request)
    {
        $menu = 'retired';
        $mes = $request->input('mes', date('m'));

        $aniversariantes = DB::table('pessoa_fisica')
            ->join('pessoa_juridica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->join('dcm_postosmilitares', 'pessoa_juridica.id_patente', '=', 'dcm_postosmilitares.Posto_Id')
            ->join('especialidade', 'pessoa_juridica.id_especialidade', '=', 'especialidade.id_especialidade')
            ->where('especialidade.id_dir_especialidade', 60)
            ->whereMonth('pessoa_fisica.Data_Nascimento', $mes)
            ->select(
                'dcm_postosmilitares.PostoAbrev',
                'pessoa_juridica.nip',
                'pessoa_fisica.nome',
                DB::raw("TIMESTAMPDIFF(YEAR, pessoa_fisica.Data_Nascimento, CURRENT_DATE) AS idade"),
                DB::raw("DATE_FORMAT(pessoa_fisica.Data_Nascimento, '%d/%m/%Y') AS Data_Nascimento"),
                'pessoa_fisica.id_pessoa_fisica',
                DB::raw("DAY(pessoa_fisica.Data_Nascimento) AS dia_nascimento")
            )
            ->orderBy('pessoa_juridica.id_patente')
            ->orderBy('dia_nascimento')
            ->paginate(15)
            ->appends($request->query());;

        return view('retirement.birthday', [
            'aniversariantes' => $aniversariantes,
            'mes' => $mes,
            'menu' => 'menu'
        ]);
    }
}
