<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\AddPessoaEstruturaRequest;
use App\Http\Requests\StoreAdmnistrationRequest;
use App\Http\Requests\StoreEstruturaRequest;
use App\Http\Requests\StoreCargoRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\UpdateEstruturaRequest;

class OrganicStructureController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $dadosEstrutura = DB::table('estrutura_organica')
            ->distinct()
            ->leftJoin('tbl_cargo_pessoa', 'estrutura_organica.id_estrutura_organica', '=', 'tbl_cargo_pessoa.id_estrutura_organica')
            ->leftJoin('pessoa_juridica', 'tbl_cargo_pessoa.id_pessoa', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->leftJoin('pessoa_fisica', 'pessoa_juridica.id_pessoa_juridica', '=', 'pessoa_fisica.id_pessoa_fisica')
            ->leftJoin('qry_cargo_pessoa', 'estrutura_organica.id_estrutura_organica', '=', 'qry_cargo_pessoa.id_estrutura_organica')
            ->join('cargo', 'estrutura_organica.id_cargo', '=', 'cargo.id_cargo')
            ->join('funcao', 'estrutura_organica.id_funcao', '=', 'funcao.id_funcao')
            ->join('dcm_postosmilitares', 'estrutura_organica.id_posto_organico', '=', 'dcm_postosmilitares.Posto_Id')
            ->join('tbl_dependencias', 'estrutura_organica.id_dependencia', '=', 'tbl_dependencias.id_dependencia')
            ->join('tbl_estrutura_sub_unidade', 'tbl_dependencias.id_sub_unidade_mae', '=', 'tbl_estrutura_sub_unidade.id_es')
            ->leftJoin('do_unidadesmilitares', 'do_unidadesmilitares.UnidadeID', '=', 'tbl_dependencias.id_unidade_pai')
            ->leftJoin('tbl_regiaomilitar', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
            ->leftJoin('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')
            ->select([
                'estrutura_organica.id_estrutura_organica',
                'qry_cargo_pessoa.contar_cargos AS cargos_ocupados',
                'cargo.nome_cargo AS cargo',
                'funcao.nome_funcao AS funcao',
                'dcm_postosmilitares.PostoAbrev AS posto',
                'estrutura_organica.quantidade_organica AS qtd_org',
                'tbl_dependencias.id_sub_unidade_mae',
                DB::raw("CONCAT(
            SUBSTRING_INDEX(pessoa_fisica.nome, ' ', 1),
            ' ',
            SUBSTRING_INDEX(pessoa_fisica.nome, ' ', -1)
        ) AS pessoa"),
                'tbl_regiaomilitar.abrev_RM',
                'do_unidadesmilitares.Ueo',
                'do_unidadesmilitares.Ueo_Abrev',
                'do_ramos.RamoID',
                'do_ramos.DescRamo',
                DB::raw("CONCAT(tbl_estrutura_sub_unidade.descricao_sub_unidade, ' - ', do_unidadesmilitares.Ueo, ' / ', tbl_regiaomilitar.abrev_RM) AS unidade_mae"),
            ])
            // 🧠 Aqui está a parte importante:
            ->orderByRaw("CASE WHEN do_ramos.RamoID = 5 THEN 0 ELSE 1 END")
            ->orderBy('estrutura_organica.id_estrutura_organica', 'asc')->get();

        return view('organicStructure.list.index', ['menu' => 'structures', 'estruturas' => $dadosEstrutura,]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $regioes = DB::table('tbl_regiaomilitar')->select('CodRM as id_regiao', 'Designacao_RM as nome_regiao')->get();
        $maes = DB::table('tbl_estrutura_sub_unidade')->where('id_es', '<>', 27)->select('id_es as id_mae', 'descricao_sub_unidade as mae')->orderBy('mae')->get();
        $filhos = DB::table('tbl_estrutura_sub_unidade')->where('id_es', '<>', 26)->select('id_es as id_filhode', 'descricao_sub_unidade as filho')->orderBy('filho')->get();
        $cargos = DB::table('cargo')->select('id_cargo as cargo_id', 'nome_cargo as cargo_nome')->orderBy('nome_cargo')->get();
        $pessoas = DB::table('pessoa_juridica')->join('pessoa_fisica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')->join('dcm_postosmilitares', 'dcm_postosmilitares.Posto_Id', '=', 'pessoa_juridica.id_patente')->select('id_pessoa_juridica', DB::raw("CONCAT(pessoa_juridica.nip,'-',dcm_postosmilitares.Posto ,'-',pessoa_fisica.nome ) AS Dados_Pessoa"))->orderBy('dcm_postosmilitares.Posto_Id')->orderBy('pessoa_fisica.nome')->get();
        $postos = DB::table('dcm_postosmilitares')->select('Posto_Id as po_id', 'Posto as po_nome')->orderBy('Posto_Id')->get();
        $tipos = DB::table('tbl_tipo_subunidade')->select('id_tipo_subunidade', 'descricao')->orderBy('descricao')->get();
        $funcoes = DB::table('funcao')->select('id_funcao as funcao_id', 'nome_funcao as funcao_nome')->orderBy('nome_funcao')->get();
        $ramos = DB::table('do_ramos')->select('RamoID', 'Ramo', 'DescRamo')->orderBy('RamoID')->get();

        $menu = 'structures';

        return view('organicStructure.create.create', compact('regioes', 'maes', 'filhos', 'cargos', 'pessoas', 'postos', 'funcoes', 'tipos', 'menu', 'ramos'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreEstruturaRequest $request)
    {
        $dados = $request->validated();

        // Verificação de dependência com os dados
        $dependencia = DB::table('tbl_dependencias')->where([
            ['id_unidade_pai', '=', $dados['unidade']],
            ['id_sub_unidade_mae', '=', $dados['id_sub_unidade_mae']],
            ['id_sub_sub_filho', '=', $dados['id_sub_unidade_filho']],
        ])->first();

        if (!$dependencia) {
            $idDependencia = DB::table('tbl_dependencias')->insertGetId([
                'id_unidade_pai' => $dados['unidade'],
                'id_sub_unidade_mae' => $dados['id_sub_unidade_mae'],
                'id_sub_sub_filho' => $dados['id_sub_unidade_filho'],
                'id_usuario' => auth()->id() ?? 1, // ou outro valor padrão
            ]);
        } else {
            $idDependencia = $dependencia->id_dependencia;
        }

        // Remover id_regiao dos dados antes de salvar
        unset($dados['regiao']);

        DB::table('estrutura_organica')->insert([
            'id_dependencia' => $idDependencia,
            'id_funcao' => $dados['id_funcao'],
            'id_cargo' => $dados['id_cargo'],
            'id_posto_organico' => $dados['id_posto_organico'],
            'quantidade_organica' => $dados['qtd_org'],
            'tipo_cargo' => $dados['principal_cargo'],
        ]);

        return redirect()->route('structure.index')->with('success', 'Estrutura cadastrada!');
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Buscar os detalhes da estrutura orgânica
        $estrutura = DB::select(
            "
            SELECT
            estrutura_organica.id_estrutura_organica,
            tbl_estrutura_sub_unidade.descricao_sub_unidade,
            cargo.nome_cargo AS cargo,
            funcao.nome_funcao AS funcao,
            estrutura_organica.quantidade_organica AS qtd_org,
            dcm_postosmilitares.Posto,
            dcm_postosmilitares.Posto_Id,
            qry_cargo_pessoa.contar_cargos,
            CONCAT(
                IF(Estrutura_Mae.visualizacao = 0, '', CONCAT(Estrutura_Mae.descricao_sub_unidade, ' ')),
                CASE
                    WHEN tbl_estrutura_sub_unidade.id_es = 27 THEN ''
                    ELSE tbl_estrutura_sub_unidade.descricao_sub_unidade
                END
            ) AS nome_unidade
         FROM estrutura_organica
        INNER JOIN tbl_dependencias
            ON tbl_dependencias.id_dependencia = estrutura_organica.id_dependencia
        LEFT JOIN tbl_estrutura_sub_unidade
            ON tbl_estrutura_sub_unidade.id_es = tbl_dependencias.id_sub_sub_filho
        LEFT JOIN tbl_estrutura_sub_unidade AS Estrutura_Mae
            ON tbl_dependencias.id_sub_unidade_mae = Estrutura_Mae.id_es
        INNER JOIN cargo
            ON cargo.id_cargo = estrutura_organica.id_cargo
        INNER JOIN dcm_postosmilitares
            ON dcm_postosmilitares.Posto_Id = estrutura_organica.id_posto_organico
        INNER JOIN funcao
            ON funcao.id_funcao = estrutura_organica.id_funcao
        LEFT JOIN qry_cargo_pessoa
            ON estrutura_organica.id_estrutura_organica = qry_cargo_pessoa.id_estrutura_organica
        WHERE estrutura_organica.id_estrutura_organica = ?
        LIMIT 1
     ",
            [$id],
        );

        if (empty($estrutura)) {
            return redirect()->route('estrutura.index')->with('error', 'Estrutura não encontrada.');
        }

        // Buscar a lista de pessoas associadas à estrutura orgânica
        $pessoas = DB::select(
            "
        SELECT
            tbl_cargo_pessoa.id_cp,
            pessoa_fisica.nome AS nome,
            pessoa_juridica.nip AS nip,
            dcm_postosmilitares.Posto AS posto
        FROM tbl_cargo_pessoa
        LEFT JOIN estrutura_organica ON tbl_cargo_pessoa.id_estrutura_organica = estrutura_organica.id_estrutura_organica
        INNER JOIN pessoa_juridica ON tbl_cargo_pessoa.id_pessoa = pessoa_juridica.id_pessoa_juridica
        INNER JOIN pessoa_fisica ON pessoa_juridica.id_pessoa_juridica = pessoa_fisica.id_pessoa_fisica
        INNER JOIN dcm_postosmilitares ON pessoa_juridica.id_patente = dcm_postosmilitares.Posto_Id
        WHERE tbl_cargo_pessoa.id_estrutura_organica = ?",
            [$id],
        );

        return view('organicStructure.show.show', [
            'estrutura' => $estrutura[0],
            'pessoas' => $pessoas,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $estrutura = DB::table('estrutura_organica')
            ->join('tbl_dependencias', 'estrutura_organica.id_dependencia', '=', 'tbl_dependencias.id_dependencia')
            ->leftJoin('do_unidadesmilitares', 'tbl_dependencias.id_unidade_pai', '=', 'do_unidadesmilitares.UnidadeID')
            ->leftJoin('tbl_regiaomilitar', 'do_unidadesmilitares.RM', '=', 'tbl_regiaomilitar.CodRM') // Relaciona a tabela de unidades com a tabela de regiões
            ->leftJoin('do_ramos', 'tbl_regiaomilitar.RamoID', '=', 'do_ramos.RamoID')
            ->where('estrutura_organica.id_estrutura_organica', $id)
            ->select(
                'estrutura_organica.*',
                'tbl_dependencias.id_unidade_pai',
                'tbl_dependencias.id_sub_unidade_mae',
                'tbl_dependencias.id_sub_sub_filho',
                'do_unidadesmilitares.RM as id_regiao', // Aqui, pegamos o CodRM da tbl_regiaomilitar
                'do_ramos.RamoID',
                'do_ramos.Ramo'
            )
            ->first();

        // Listas auxiliares
        $regioes = DB::table('tbl_regiaomilitar')->get();
        $subUnidades = DB::table('tbl_estrutura_sub_unidade')->get();
        $unidadesMilitares = DB::table('do_unidadesmilitares')->get();
        $funcoes = DB::table('funcao')->select('id_funcao', 'nome_funcao')->orderBy('nome_funcao')
            ->get();
        $ramos = DB::table('do_ramos')->select('RamoID', 'Ramo', 'DescRamo')->orderBy('RamoID')->get();
        $cargos = DB::table('cargo')->get();
        $postos = DB::table('dcm_postosmilitares')->get();
        $tipos = DB::table('tbl_tipo_subunidade')->select('id_tipo_subunidade', 'descricao')->orderBy('descricao')->get();
        return view('organicStructure.edit.edit', compact('estrutura', 'regioes', 'subUnidades', 'funcoes', 'cargos', 'postos', 'unidadesMilitares', 'tipos', 'ramos'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreEstruturaRequest $request, $id)
    {
        $dados = $request->validated();

        // Atualizar dependência
        $dependencia = DB::table('tbl_dependencias')
            ->where([['id_unidade_pai', '=', $dados['unidade']], ['id_sub_unidade_mae', '=', $dados['id_sub_unidade_mae']], ['id_sub_sub_filho', '=', $dados['id_sub_unidade_filho']]])
            ->first();

        if (!$dependencia) {
            $idDependencia = DB::table('tbl_dependencias')->insertGetId([
                'id_unidade_pai' => $dados['unidade'],
                'id_sub_unidade_mae' => $dados['id_sub_unidade_mae'],
                'id_sub_sub_filho' => $dados['id_sub_unidade_filho'],
                'id_usuario' => auth()->id() ?? 1,
            ]);
        } else {
            $idDependencia = $dependencia->id_dependencia;
        }

        // Atualizar estrutura
        DB::table('estrutura_organica')
            ->where('id_estrutura_organica', $id)
            ->update([
                'id_dependencia' => $idDependencia,
                'id_funcao' => $dados['id_funcao'],
                'id_cargo' => $dados['id_cargo'],
                'tipo_cargo' => $dados['principal_cargo'],
                'quantidade_organica' => $dados['qtd_org'],
                'id_posto_organico' => $dados['id_posto_organico'],
            ]);

        return redirect()->route('structure.index')->with('success', 'Estrutura actualizada!');
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            // Verifica se a estrutura existe
            $estrutura = DB::table('estrutura_organica')->where('id_estrutura_organica', $id)->first();

            if (!$estrutura) {
                return redirect()->route('structure.index')->with('error', 'Estrutura não encontrada.');
            }

            // Impede a exclusão se o utilizador for Oficial da RPSI
            if (auth()->user()->hasRole('Oficial da RPSI')) {
                return back()->with('error', 'Não tem permissão para remover o registo.');
            }

            // Deleta a estrutura
            DB::table('estrutura_organica')->where('id_estrutura_organica', $id)->delete();

            return redirect()->route('structure.index')->with('success', 'Estrutura removida!');
        } catch (\Exception $e) {
            return redirect()->route('structure.index')->with('error', 'Erro ao apagar a estrutura.');
        }
    }
    public function AddPessoaCargo(AddPessoaEstruturaRequest $request, $id)
    {
        try {
            DB::table('tbl_cargo_pessoa')->insert([
                'id_pessoa' => $request->id_pessoa_juridica,
                'id_estrutura_organica' => $id,
                'id_usuario' => auth()->id(),
                'data_registro' => now(),
            ]);

            return redirect()
                ->route('structure.show', ['id' => $id])
                ->with('success', 'Militar adiccionado ao cargo !');
        } catch (\Exception $e) {
            return redirect()
                ->route('structure.show', ['id' => $id])
                ->with('error', 'Erro ao adicionar militar: ' . $e->getMessage());
        }
    }

    // Nova função para autocomplete
    public function searchMilitar(Request $request)
    {
        $query = $request->get('query');
        \Log::debug("Pesquisando militar por: " . $query);

        $militares = DB::table('pessoa_juridica')
            ->join('pessoa_fisica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->join('dcm_postosmilitares', 'pessoa_juridica.id_patente', '=', 'dcm_postosmilitares.Posto_Id')
            ->where(function ($q) use ($query) {
                $q->where('pessoa_juridica.nip', 'like', "%$query%")
                    ->orWhere('pessoa_fisica.nome', 'like', "%$query%");
            })
            ->select(
                'pessoa_juridica.id_pessoa_juridica',
                'pessoa_juridica.nip',
                'pessoa_fisica.nome',
                'dcm_postosmilitares.PostoAbrev'
            )
            ->limit(10)
            ->get();

        return response()->json($militares);
    }

    public function ApagarPessoaCargo($id)
    {
        // Buscar o registro antes de deletá-lo
        $estrutura = DB::table('tbl_cargo_pessoa')->where('id_cp', $id)->first();

        if (!$estrutura) {
            return redirect()->back()->with('error', 'Erro: Registro não encontrado.');
        }

        // Impede a exclusão se o utilizador for Oficial da RPSI
        if (auth()->user()->hasRole('Oficial da RPSI')) {
            return back()->with('error', 'Não tem permissão para remover a pessoa do cargo.');
        }

        // Excluir o registro
        DB::table('tbl_cargo_pessoa')->where('id_cp', $id)->delete();

        return redirect()
            ->back()
            ->with('success', 'Pessoa removida do cargo!');
    }

    public function CadeiaComando()
    {
        // Buscar regiões militares       
        $regioes = DB::table('tbl_regiaomilitar')
            ->join('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')
            ->select(
                'tbl_regiaomilitar.Designacao_RM as regiao',
                'tbl_regiaomilitar.CodRM as cod_regiao',
                'do_ramos.RamoID as id_ramo',
                'do_ramos.Ramo'
            )
            ->where('do_ramos.RamoID', '=', 5)
            ->get();


        foreach ($regioes as &$regiao) {
            // Buscar unidades dentro da região
            $regiao->unidades = DB::select('SELECT UnidadeID, Ueo AS ueo FROM do_unidadesmilitares WHERE RM = ?', [$regiao->cod_regiao]);

            foreach ($regiao->unidades as &$unidade) {
                // Buscar cargos dentro da unidade
                $unidade->cargos = DB::select(
                    "SELECT
                    pessoa_fisica.nome,
                    TRIM(SUBSTRING_INDEX(pessoa_fisica.nome, ' ', 1)) AS primeiro_nome,
                    TRIM(SUBSTRING_INDEX(pessoa_fisica.nome, ' ', -1)) AS ultimo_nome,
                    CONCAT(dcm_postosmilitares.PostoAbrev, ' (', dcm_classes.Classe_abv, ') ', pessoa_juridica.nip, ' ', pessoa_fisica.nome) AS ocupante,
                    cargo.nome_cargo, dcm_postosmilitares.PostoAbrev,
                    CONCAT(cargo.nome_cargo, ' ',
                        IF(subunidade_mae.visualizacao = 0, '', subunidade_mae.descricao_sub_unidade),
                        CASE
                            WHEN subunidade_filho.id_es = 27 THEN ''
                            ELSE subunidade_filho.descricao_sub_unidade
                        END
                    ) AS cargo_ueo
                FROM
                    tbl_cargo_pessoa
                RIGHT JOIN estrutura_organica ON tbl_cargo_pessoa.id_estrutura_organica = estrutura_organica.id_estrutura_organica
                LEFT JOIN pessoa_juridica ON tbl_cargo_pessoa.id_pessoa = pessoa_juridica.id_pessoa_juridica
                LEFT JOIN pessoa_fisica ON pessoa_juridica.id_pessoa_juridica = pessoa_fisica.id_pessoa_fisica
                LEFT JOIN dcm_postosmilitares ON pessoa_juridica.id_patente = dcm_postosmilitares.Posto_Id
                LEFT JOIN especialidade ON pessoa_juridica.id_especialidade = especialidade.id_especialidade
                LEFT JOIN dcm_classes ON especialidade.id_quadro_especial = dcm_classes.Classe_Id
                INNER JOIN cargo ON estrutura_organica.id_cargo = cargo.id_cargo
                INNER JOIN tbl_dependencias ON estrutura_organica.id_dependencia = tbl_dependencias.id_dependencia
                INNER JOIN tbl_estrutura_sub_unidade AS subunidade_mae ON tbl_dependencias.id_sub_unidade_mae = subunidade_mae.id_es
                INNER JOIN tbl_estrutura_sub_unidade AS subunidade_filho ON tbl_dependencias.id_sub_sub_filho = subunidade_filho.id_es
                WHERE estrutura_organica.tipo_cargo = 1 AND tbl_dependencias.id_unidade_pai = ?",
                    [$unidade->UnidadeID],
                );
            }
        }

        $menu = 'structures';
        return view('organicStructure.chainCommand.index', compact('regioes', 'menu'));
    }

    public function storeSubunidade(StoreAdmnistrationRequest $request)
    {
        $dados = $request->only(['descricao_sub_unidade', 'id_tipo']);

        $inserido = DB::table('tbl_estrutura_sub_unidade')->insert($dados);

        return redirect()
            ->back()
            ->with($inserido ? 'success' : 'error', $inserido ? 'Subunidade cadastrada!' : 'Erro ao cadastrar subunidade.');
    }

    public function StoreCargo(StoreCargoRequest $request)
    {
        $dados = [
            'nome_cargo' => $request->nome_cargo,
            'id_funcao' => $request->id_funcao,
        ];

        $inserido = DB::table('cargo')->insert($dados);

        return redirect()
            ->back()
            ->with($inserido ? 'success' : 'error', $inserido ? 'Cargo cadastrado!' : 'Erro ao cadastrar cargo.');
    }
}
