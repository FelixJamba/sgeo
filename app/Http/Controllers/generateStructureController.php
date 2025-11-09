<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class generateStructureController extends Controller
{
    public function generalView()
    {
        $menu = 'generate';

        $regioes = DB::table('tbl_regiaomilitar')->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao')->get();

        $ueos = DB::table('do_unidadesmilitares')->select('UnidadeID as id_unidade_pai', 'Ueo as Ueo')->get();

        return view('organicStructure.generateStructure.general', compact('ueos', 'regioes', 'menu'));
    }

    public function geral(Request $request)
    {
        $request->validate([
            'regiao' => 'required|integer',
            'unidade' => 'required|integer',
            'filtro' => 'nullable|in:1,2,3',
        ]);

        $regioes = DB::table('tbl_regiaomilitar')->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao')->get();
        // Inicializa a variável $ueos
        $ueos = [];

        // Se a região estiver presente no request, carrega as UEOs correspondentes
        if ($request->filled('regiao')) {
            $ueos = DB::table('do_unidadesmilitares')->select('UnidadeID as id_unidade_pai', 'Ueo')->where('RM', $request->regiao)->get();
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

            ->where('dep.id_unidade_pai', $request->unidade)
            ->select(
                'eo.id_estrutura_organica',
                'c.nome_cargo',
                'p.PostoAbrev as Posto',
                'eo.quantidade_organica',
                DB::raw("CONCAT(SUBSTRING_INDEX(pf.nome, ' ', 1), ' ', SUBSTRING_INDEX(pf.nome, ' ', -1)) as nome"), // <-- substituindo pessoa.nome
                'esu.descricao_sub_unidade',
                'dep.id_dependencia',
                'patente.PostoAbrev as patente',
            )->orderBy('eo.id_estrutura_organica');

        if ($request->filtro == 2) {
            $query->whereNotNull('cp.id_pessoa');
        } elseif ($request->filtro == 3) {
            $query->whereNull('cp.id_pessoa');
        }

        $estrutura = $query->get();

        return view('organicStructure.generateStructure.general', compact('ueos', 'estrutura', 'regioes'));
    }

    public function specificView()
    {
        $menu = 'generate';

        $regioes = DB::table('tbl_regiaomilitar')->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao')->get();

        $ueos = DB::table('do_unidadesmilitares')->select('UnidadeID as id_unidade_pai', 'Ueo as Ueo')->get();

        $subunidades = collect(); // 👈 Garante que a variável exista

        $estrutura = collect(); // 👈 Também inicialize a estrutura vazia se usada na view

        return view('organicStructure.generateStructure.specific', compact('ueos', 'subunidades', 'estrutura', 'regioes', 'menu'));
    }

    public function specific(Request $request)
    {
        $request->validate([
            'id_regiao' => 'required|integer',
            'ueo' => 'required|integer',
            'subunidade' => 'nullable|integer',
            'filtrar_cargos' => 'nullable|in:1,2,3',
        ]);

        $regioes = DB::table('tbl_regiaomilitar')->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao')->get();

        // Carrega UEOs da região selecionada
        $ueos = DB::table('do_unidadesmilitares')->select('UnidadeID as id_unidade_pai', 'Ueo')->where('RM', $request->id_regiao)->get();

        // Carrega subunidades da UEO selecionada
        $subunidades = DB::table('tbl_dependencias as d')->join('tbl_estrutura_sub_unidade as s', 's.id_es', '=', 'd.id_sub_unidade_mae')->select('s.id_es', 's.descricao_sub_unidade')->where('d.id_unidade_pai', $request->ueo)->distinct()->get();

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
                ->where('dep.id_sub_unidade_mae', $request->subunidade)
                ->when($request->filtrar_cargos == 2, fn($q) => $q->whereNotNull('cp.id_pessoa'))
                ->when($request->filtrar_cargos == 3, fn($q) => $q->whereNull('cp.id_pessoa'))
                ->select('eo.id_estrutura_organica', 'c.nome_cargo', 'p.PostoAbrev as Posto', 'eo.quantidade_organica', 'dep.id_sub_unidade_mae', 'dep.id_dependencia', 's.descricao_sub_unidade',     DB::raw("CONCAT(SUBSTRING_INDEX(pf.nome, ' ', 1), ' ', SUBSTRING_INDEX(pf.nome, ' ', -1)) as nome"),
               'patente.PostoAbrev as patente')
                
                ->get();
        }

        return view('organicStructure.generateStructure.specific', compact('regioes', 'ueos', 'subunidades', 'estrutura'))->with([
            'selected_regiao' => $request->id_regiao,
            'selected_ueo' => $request->ueo,
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
