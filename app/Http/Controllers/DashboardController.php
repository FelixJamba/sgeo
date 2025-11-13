<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    // Dashboard principal
    public function index()
    {
        // Log
        Log::info('Carregar o dashboard.', ['action_user_id' => Auth::id()]);

        // Obter dados para gráfico por região
        $chartRegiao = $this->especialistasPorRegiao();

        // Obter dados para gráfico por posto
        $chartPosto = $this->especialistasPorPosto();

        // Totais
        $totalEspecialistas = DB::table('pessoa_juridica')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->where('situacao_servico.id_situacao', '=', 1)
            ->count();

        $cargosOcupados = DB::table('tbl_cargo_pessoa')
            ->join('estrutura_organica', 'tbl_cargo_pessoa.id_estrutura_organica', '=', 'estrutura_organica.id_estrutura_organica')
            ->whereNotNull('tbl_cargo_pessoa.id_pessoa')
            ->count();

        $cargosVagos = DB::table('estrutura_organica')
            ->leftJoin('tbl_cargo_pessoa', 'estrutura_organica.id_estrutura_organica', '=', 'tbl_cargo_pessoa.id_estrutura_organica')
            ->whereNull('tbl_cargo_pessoa.id_pessoa')
            ->count();


        // Comentado: Auditoria para atividades recentes
        // $atividades = DB::table('audits')
        //     ->latest()
        //     ->take(10)
        //     ->get();

        return view('dashboard.index', [
            'menu' => 'dashboard',
            'chartRegiao' => $chartRegiao,
            'chartPosto' => $chartPosto,
            'totalEspecialistas' => $totalEspecialistas,
            'cargosOcupados' => $cargosOcupados,
            'cargosVagos' => $cargosVagos,
            // 'atividades' => $atividades, // Para uso futuro
        ]);
    }

    // Especialistas por Região Militar
    private function especialistasPorRegiao()
    {
        $regioes = DB::table('tbl_regiaomilitar')
            ->leftJoin('do_unidadesmilitares', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
            ->leftJoin('tbl_dependencias', 'do_unidadesmilitares.UnidadeID', '=', 'tbl_dependencias.id_unidade_pai')
            ->leftJoin('estrutura_organica', 'tbl_dependencias.id_dependencia', '=', 'estrutura_organica.id_dependencia')
            ->leftJoin('tbl_cargo_pessoa', 'estrutura_organica.id_estrutura_organica', '=', 'tbl_cargo_pessoa.id_estrutura_organica')
            ->leftJoin('pessoa_juridica', 'tbl_cargo_pessoa.id_pessoa', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->where('tbl_regiaomilitar.estado_regiao', '=', 1)
            ->where('situacao_servico.id_situacao', '=', 1)
            ->select(
                DB::raw('COUNT(pessoa_juridica.id_pessoa_juridica) AS numero_especialistas'),
                'tbl_regiaomilitar.CodRM',
                'tbl_regiaomilitar.Designacao_RM'
            )->orderBy('tbl_regiaomilitar.RamoID', 'asc')
            ->groupBy('tbl_regiaomilitar.CodRM', 'tbl_regiaomilitar.Designacao_RM')
            ->get();


        $labels = [];
        $data = [];

        foreach ($regioes as $item) {
            $labels[] = $item->Designacao_RM;
            $data[] = $item->numero_especialistas;
        }

        return [
            'labels' => $labels,
            'data' => $data,
        ];
    }

    // Especialistas por Posto Militar
    private function especialistasPorPosto()
    {
        $postos = DB::table('pessoa_juridica')
            ->join('especialidade', 'pessoa_juridica.id_especialidade', '=', 'especialidade.id_especialidade')
            ->join('dcm_postosmilitares', 'pessoa_juridica.id_patente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->where('especialidade.id_dir_especialidade', 60)
            ->where('situacao_servico.id_situacao', '=', 1) // apenas activos
            ->select(
                'dcm_postosmilitares.PostoAbrev as posto',
                'dcm_postosmilitares.Posto_Id',
                DB::raw('COUNT(pessoa_juridica.id_pessoa_juridica) as total')
            )
            ->groupBy('dcm_postosmilitares.PostoAbrev', 'dcm_postosmilitares.Posto_Id')
            ->orderBy('dcm_postosmilitares.Posto_Id', 'asc')
            ->get();

        $labels = [];
        $data = [];

        foreach ($postos as $item) {
            $labels[] = $item->posto;
            $data[] = $item->total;
        }

        return [
            'labels' => $labels,
            'data' => $data,
        ];
    }
}
