<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class generateStructureController extends Controller
{
    public function generalView()
    {
        $menu = 'generate';

        $ramos = DB::table('do_ramos')
            ->select('RamoID', 'Ramo', 'DescRamo')
            ->orderBy('RamoID')
            ->get();

        $regioes = DB::table('tbl_regiaomilitar')
            ->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao', 'RamoID')
            ->get();

        $ueos = DB::table('do_unidadesmilitares')
            ->select('UnidadeID as id_unidade_pai', 'Ueo', 'RM')
            ->get();

        return view('organicStructure.generateStructure.general', compact('ueos', 'regioes', 'ramos', 'menu'));
    }


    public function geral(Request $request)
    {
        $request->validate([
            'ramo' => 'required|integer',
            'id_regiao' => 'nullable|integer',
            'unidade' => 'nullable|integer',
            'filtro' => 'nullable|in:1,2,3',
        ]);

        $ramos = DB::table('do_ramos')->select('RamoID', 'Ramo', 'DescRamo')->get();
        $regioes = DB::table('tbl_regiaomilitar')
            ->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao', 'RamoID')
            ->get();

        $ueos = [];

        if ($request->filled('id_regiao')) {
            $ueos = DB::table('do_unidadesmilitares')
                ->select('UnidadeID as id_unidade_pai', 'Ueo', 'RM')
                ->where('RM', $request->id_regiao)
                ->get();
        }

        $query = DB::table('tbl_dependencias as dep')
            ->join('estrutura_organica as eo', 'dep.id_dependencia', '=', 'eo.id_dependencia')
            ->leftJoin('tbl_cargo_pessoa as cp', 'cp.id_estrutura_organica', '=', 'eo.id_estrutura_organica')
            ->leftJoin('dcm_postosmilitares as p', 'p.Posto_Id', '=', 'eo.id_posto_organico')
            ->leftJoin('qry_cargo_pessoa as qcp', 'qcp.id_estrutura_organica', '=', 'eo.id_estrutura_organica')
            ->leftJoin('cargo as c', 'c.id_cargo', '=', 'eo.id_cargo')
            ->leftJoin('tbl_estrutura_sub_unidade as esu', 'esu.id_es', '=', 'dep.id_sub_unidade_mae')
            ->leftJoin('pessoa_juridica as pj', 'pj.id_pessoa_juridica', '=', 'cp.id_pessoa')
            ->leftJoin('dcm_postosmilitares as patente', 'patente.Posto_Id', '=', 'pj.id_patente')
            ->leftJoin('pessoa_fisica as pf', 'pf.id_pessoa_fisica', '=', 'pj.id_pessoa_juridica')
            ->leftJoin('do_unidadesmilitares', 'do_unidadesmilitares.UnidadeID', '=', 'dep.id_unidade_pai')
            ->leftJoin('tbl_regiaomilitar', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
            ->leftJoin('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')
            ->select(
                'eo.id_estrutura_organica',
                'c.nome_cargo',
                'p.PostoAbrev as Posto',
                'p.Posto_Id',
                'eo.quantidade_organica',
                'do_ramos.RamoID',
                'tbl_regiaomilitar.abrev_RM',
                DB::raw("CONCAT(SUBSTRING_INDEX(pf.nome, ' ', 1), ' ', SUBSTRING_INDEX(pf.nome, ' ', -1)) as nome"),
                'esu.descricao_sub_unidade',
                'dep.id_dependencia',
                'patente.PostoAbrev as patente'
            )
            ->where('do_ramos.RamoID', $request->ramo);

        // 👉 se o campo de região for usado como filtro direto
        if ($request->filled('id_regiao')) {
            $query->where('tbl_regiaomilitar.CodRM', $request->id_regiao);
        }

        if ($request->filled('unidade')) {
            $query->where('dep.id_unidade_pai', $request->unidade);
        }

        if ($request->filtro == 2) {
            $query->whereNotNull('cp.id_pessoa');
        } elseif ($request->filtro == 3) {
            $query->whereNull('cp.id_pessoa');
        }

        $estrutura = $query
            ->orderBy('eo.id_estrutura_organica')
            ->orderBy('p.Posto_Id')
            ->get();

        return view('organicStructure.generateStructure.general', compact('ueos', 'estrutura', 'regioes', 'ramos'));
    }



    public function specificView()
    {
        $menu = 'generate';

        // 🔹 Carrega todos os ramos
        $ramos = DB::table('do_ramos')
            ->select('RamoID', 'Ramo', 'DescRamo')
            ->orderBy('RamoID')
            ->get();

        // 🔹 Carrega todas as regiões com o Ramo associado
        $regioes = DB::table('tbl_regiaomilitar')
            ->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao', 'RamoID')
            ->get();

        // 🔹 Todas as UEOs (carregadas depois via seleção)
        $ueos = DB::table('do_unidadesmilitares')
            ->select('UnidadeID as id_unidade_pai', 'Ueo', 'RM')
            ->get();

        $subunidades = collect();
        $estrutura = collect();

        return view('organicStructure.generateStructure.specific', compact('ramos', 'regioes', 'ueos', 'subunidades', 'estrutura', 'menu'));
    }

    public function specific(Request $request)
    {
        $request->validate([
            'ramo' => 'required|integer',
            'id_regiao' => 'required|integer',
            'unidade' => 'required|integer',
            'subunidade' => 'nullable|integer',
            'filtrar_cargos' => 'nullable|in:1,2,3',
        ]);

        // 🔹 Carrega ramos
        $ramos = DB::table('do_ramos')->select('RamoID', 'Ramo', 'DescRamo')->get();

        // 🔹 Carrega regiões do ramo selecionado
        $regioes = DB::table('tbl_regiaomilitar')
            ->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao', 'RamoID')
            ->where('RamoID', $request->ramo)
            ->get();

        // 🔹 Carrega UEOs da região selecionada
        $ueos = DB::table('do_unidadesmilitares')
            ->select('UnidadeID as id_unidade_pai', 'Ueo', 'RM')
            ->where('RM', $request->id_regiao)
            ->get();

        // 🔹 Carrega subunidades da UEO selecionada
        $subunidades = DB::table('tbl_dependencias as d')
            ->join('tbl_estrutura_sub_unidade as s', 's.id_es', '=', 'd.id_sub_unidade_mae')
            ->select('s.id_es', 's.descricao_sub_unidade')
            ->where('d.id_unidade_pai', $request->unidade)
            ->distinct()
            ->get();

        $estrutura = collect();

        if ($request->filled('subunidade')) {
            $estrutura = DB::table('tbl_dependencias as dep')
                ->join('estrutura_organica as eo', 'dep.id_dependencia', '=', 'eo.id_dependencia')
                ->leftJoin('tbl_cargo_pessoa as cp', 'cp.id_estrutura_organica', '=', 'eo.id_estrutura_organica')
                ->leftJoin('dcm_postosmilitares as p', 'p.Posto_Id', '=', 'eo.id_posto_organico')
                ->leftJoin('qry_cargo_pessoa as qcp', 'qcp.id_estrutura_organica', '=', 'eo.id_estrutura_organica')
                ->leftJoin('cargo as c', 'c.id_cargo', '=', 'eo.id_cargo')
                ->leftJoin('tbl_estrutura_sub_unidade as s', 's.id_es', '=', 'dep.id_sub_unidade_mae')
                ->leftJoin('pessoa_juridica as pj', 'pj.id_pessoa_juridica', '=', 'cp.id_pessoa')
                ->leftJoin('dcm_postosmilitares as patente', 'patente.Posto_Id', '=', 'pj.id_patente')
                ->leftJoin('pessoa_fisica as pf', 'pf.id_pessoa_fisica', '=', 'pj.id_pessoa_juridica')
                ->leftJoin('do_unidadesmilitares', 'do_unidadesmilitares.UnidadeID', '=', 'dep.id_unidade_pai')
                ->leftJoin('tbl_regiaomilitar', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
                ->leftJoin('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')
                ->when($request->filtrar_cargos == 2, fn($q) => $q->whereNotNull('cp.id_pessoa'))
                ->when($request->filtrar_cargos == 3, fn($q) => $q->whereNull('cp.id_pessoa'))
                ->where('do_ramos.RamoID', $request->ramo)
                ->where('tbl_regiaomilitar.CodRM', $request->id_regiao)
                ->where('dep.id_sub_unidade_mae', $request->subunidade)
                ->select(
                    'eo.id_estrutura_organica',
                    'c.nome_cargo',
                    'p.PostoAbrev as Posto',
                    'eo.quantidade_organica',
                    'dep.id_sub_unidade_mae',
                    'dep.id_dependencia',
                    's.descricao_sub_unidade',
                    DB::raw("CONCAT(SUBSTRING_INDEX(pf.nome, ' ', 1), ' ', SUBSTRING_INDEX(pf.nome, ' ', -1)) as nome"),
                    'patente.PostoAbrev as patente'
                )
                ->get();
        }

        return view('organicStructure.generateStructure.specific', compact('ramos', 'regioes', 'ueos', 'subunidades', 'estrutura'))
            ->with([
                'selected_ramo' => $request->ramo,
                'selected_regiao' => $request->id_regiao,
                'selected_ueo' => $request->unidade,
                'selected_subunidade' => $request->subunidade,
                'selected_cargos' => $request->filtrar_cargos,
            ]);
    }


    public function getUeos($regiao)
    {
        $ueos = DB::table('do_unidadesmilitares')->select('UnidadeID as id_unidade_pai', 'Ueo')->where('RM', $regiao)->get();

        return response()->json($ueos);
    }

    public function getSubunidades($ueo)
    {
        $subunidades = DB::table('tbl_dependencias as d')->join('tbl_estrutura_sub_unidade as s', 's.id_es', '=', 'd.id_sub_unidade_mae')->select('s.id_es', 's.descricao_sub_unidade')->where('d.id_unidade_pai', $ueo)->distinct()->get();

        return response()->json($subunidades);
    }
}
