<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpecialistRequest;
use App\Http\Requests\StoreOrdemRequest;
use App\Http\Requests\StoreCursoRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Traits\Auditoria;

class SpecialistController extends Controller
{
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Consulta para listar especialistas com informações relevantes
        $dadosEspecialista = DB::table('pessoa_fisica')
            ->leftJoin('pessoa_juridica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->join('dcm_postosmilitares', 'pessoa_juridica.id_patente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('especialidade', 'pessoa_juridica.id_especialidade', '=', 'especialidade.id_especialidade')
            ->leftJoin('do_unidadesmilitares AS ueo_dependencia_especialidade', 'especialidade.id_dir_especialidade', '=', 'ueo_dependencia_especialidade.UnidadeID')
            ->leftJoin('dcm_classes', 'especialidade.id_quadro_especial', '=', 'dcm_classes.Classe_Id')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->leftJoin('tbl_cargo_pessoa', 'pessoa_juridica.id_pessoa_juridica', '=', 'tbl_cargo_pessoa.id_pessoa')
            ->leftJoin('estrutura_organica', 'tbl_cargo_pessoa.id_estrutura_organica', '=', 'estrutura_organica.id_estrutura_organica')
            ->leftJoin('tbl_dependencias', 'estrutura_organica.id_dependencia', '=', 'tbl_dependencias.id_dependencia')
            ->leftJoin('tbl_estrutura_sub_unidade', 'tbl_dependencias.id_sub_sub_filho', '=', 'tbl_estrutura_sub_unidade.id_es')
            ->leftJoin('tbl_estrutura_sub_unidade AS Estrutura_Mae', 'tbl_dependencias.id_sub_unidade_mae', '=', 'Estrutura_Mae.id_es')
            ->leftJoin('do_unidadesmilitares AS Unidade_Colocado', 'tbl_dependencias.id_unidade_pai', '=', 'Unidade_Colocado.UnidadeID')
            ->leftJoin('cargo', 'estrutura_organica.id_cargo', '=', 'cargo.id_cargo')
            ->leftJoin('foto', 'pessoa_juridica.id_pessoa_juridica', '=', 'foto.id_pessoa_juridica')

            ->leftJoin('do_unidadesmilitares', 'do_unidadesmilitares.UnidadeID', '=', 'tbl_dependencias.id_unidade_pai')
            ->leftJoin('tbl_regiaomilitar', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
            ->leftJoin('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')

            ->select([
                'pessoa_fisica.id_pessoa_fisica',
                DB::raw("CONCAT(
            SUBSTRING_INDEX(pessoa_fisica.nome, ' ', 1),
            ' ',
            SUBSTRING_INDEX(pessoa_fisica.nome, ' ', -1)
        ) AS nome"),
                'pessoa_juridica.nip',
                'pessoa_juridica.id_situacao',
                'situacao_servico.id_situacao',
                'situacao_servico.nome_situacao',
                'situacao_condicoes.id',
                'situacao_condicoes.descricao',
                DB::raw("CONCAT(situacao_servico.nome_situacao, ' - ', situacao_condicoes.descricao ) AS situacao"),
                'tbl_regiaomilitar.abrev_RM',
                'do_unidadesmilitares.Ueo',
                'do_unidadesmilitares.Ueo_Abrev',
                'pessoa_juridica.id_patente',
                'dcm_postosmilitares.Posto_Id',
                'dcm_postosmilitares.Posto AS posto',
                'especialidade.nome_especialidade AS especialidade',
                'ueo_dependencia_especialidade.Ueo AS ueo_especialidade',
                'dcm_classes.Classe',
                'tbl_cargo_pessoa.id_pessoa',
                'ueo_dependencia_especialidade.UnidadeID AS id_ueo_especialidade',
                'tbl_dependencias.id_sub_sub_filho',
                'tbl_estrutura_sub_unidade.id_es',
                'tbl_estrutura_sub_unidade.descricao_sub_unidade AS sub_unidade_filho',
                'Estrutura_Mae.descricao_sub_unidade AS subunidade_mae',
                'Unidade_Colocado.UnidadeID AS id_uni_colocado',
                'cargo.nome_cargo AS cargo',
                DB::raw("CONCAT(Unidade_Colocado.Ueo, ' / ', tbl_regiaomilitar.abrev_RM) AS unidade_colocado"),
                DB::raw("CONCAT(
            cargo.nome_cargo, ' ',
            IF(Estrutura_Mae.visualizacao = 0, '', Estrutura_Mae.descricao_sub_unidade), ' ',
            CASE
                WHEN tbl_estrutura_sub_unidade.id_es = 27 THEN ''
                ELSE tbl_estrutura_sub_unidade.descricao_sub_unidade
            END
        ) AS cargocolocacao"),
                'Estrutura_Mae.visualizacao',
                'foto.foto_militar',
            ])
            ->orderBy('dcm_postosmilitares.Posto_Id')
            ->get();
        return view('specialists.index', ['menu' => 'specialists', 'specialists' => $dadosEspecialista]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // Buscar dados para os selects do formulário
        $postos = DB::table('dcm_postosmilitares')->orderBy('Posto_Id')->get();
        $quadroEspecial = DB::table('dcm_classes')->orderBy('Classe')->get();
        $especialidades = DB::table('especialidade')->orderBy('id_especialidade')->get();
        $fps = DB::table('dcm_situacao_quadro')->orderBy('Sitq_Id')->get();
        $sexos = DB::table('sexo')->orderBy('id_sexo')->get();
        $estadosCivis = DB::table('estado_civil')->orderBy('estado_civil')->get();
        $tiposDocumento = DB::table('tipo_documento')->orderBy('id_tipo_doc')->get();
        $grupoSanguineo = DB::table('tbl_gsanguineo')->orderBy('idGSangue')->get();
        $tiposContacto = DB::table('tbl_tipo_contacto')->orderBy('idTipoContactos')->get();
        $provincias = DB::table('provincia')->orderBy('idprovincia')->get();
        $municipios = DB::table('municipio')->orderBy('idmunicipio')->get();
        $zonas = DB::table('zona')->orderBy('idzona')->get();
        $bairros = DB::table('bairro')->orderBy('idbairro')->get();
        $habilitacoes = DB::table('habilitacaoLiteraria')->orderBy('habilitacao_id')->get();
        $instituicoes = DB::table('instituicao')->orderBy('id_instituicao')->get();
        $niveis = DB::table('nivel_curso')->orderBy('id_nivel_curso')->get();
        $paises = DB::table('pais')->orderBy('id_pais')->get();
        $cursos = DB::table('curso')->orderBy('id_curso')->get();
        $tipo_Incorporacao = DB::table('tipo_incorporacao')->orderBy('id_tipo')->get();
        $situacaoServico = DB::table('situacao_servico')->orderBy('id_situacao')->get();
        $situacaoCondicoes = DB::table('situacao_condicoes')->orderBy('id')->get();
        $do_ramos = DB::table('do_ramos')->orderBy('RamoID')->get();
        $ordens = DB::table('tbl_ordens')->orderBy('id')->get();
        $cargos = DB::table('cargo')->orderBy('id_cargo')->get();
        $grausParentesco = DB::table('tbl_grauparentesco')->orderBy('idGParentesco')->get();
        $tipo_curso = DB::table('tipo_curso')->get();


        $tipo_ordem = DB::table('tbl_tipoordem')->orderBy('CodTipoOrdem')->get();

        $entidades = DB::table('tbl_entidade')->where('estado', '=', ' 1')->get();
        $tiposOrdem = DB::table('tbl_tipoordem')->get();


        // === Carregar grupos de línguas e línguas por grupo ===
        $tipoLinguas = DB::table('tbl_grupo_lingua')->orderBy('id_grupo_lingua')->get();
        $linguas = DB::table('tbl_tipos_linguas')->orderBy('descricaoLingua')->get();

        $linguasPorGrupo = [];
        foreach ($tipoLinguas as $grupo) {
            $linguasPorGrupo[$grupo->id_grupo_lingua] = DB::table('tbl_tipos_linguas')
                ->where('grupoLingua', $grupo->id_grupo_lingua)
                ->orderBy('descricaoLingua')
                ->get();
        }

        return view('specialists.create', compact(
            'postos',
            'provincias',
            'quadroEspecial',
            'fps',
            'sexos',
            'estadosCivis',
            'habilitacoes',
            'tiposDocumento',
            'grupoSanguineo',
            'tiposContacto',
            'municipios',
            'situacaoServico',
            'situacaoCondicoes',
            'do_ramos',
            'instituicoes',
            'niveis',
            'paises',
            'cursos',
            'tipo_Incorporacao',
            'zonas',
            'bairros',
            'ordens',
            'cargos',
            'grausParentesco',
            'especialidades',
            'tipoLinguas',
            'linguasPorGrupo',
            'tipo_ordem',
            'entidades',
            'tiposOrdem',
            'tipo_curso'
        ));
    }


    /**
     * Store a newly created resource in storage.
     */

    public function store(SpecialistRequest $request)
    {
        DB::beginTransaction();

        try {
            // ===============================
            // 1. Inserir pessoa_fisica
            // ===============================
            $idPessoaFisica = DB::table('pessoa_fisica')->insertGetId([
                'nome' => $request->nome,
                'Alcunha' => $request->alcunha,
                'Data_Nascimento' => $request->data_nascimento,
                'id_sexo' => $request->id_sexo,
                'id_estado_civil' => $request->id_estado_civil,
                'id_naturalidade' => $request->idmunicipio,
                'nome_pai' => $request->nome_pai,
                'nome_mae' => $request->nome_mae,
                'Grupo_Sanguineo' => $request->grupo_sanguineo,
                'Altura' => $request->altura,
                'Nro_Calcado' => $request->Nro_Calcado,
                'Nro_Camisa' => $request->Nro_Camisa,
                'Nro_Calca' => $request->Nro_Calca,
                'habilitacao_id' => $request->habilitacao_id,
                'created' => now(),
            ]);

            $this->logAuditoria('pessoa_fisica', $idPessoaFisica, 'insert', $request->all());

            // ===============================
            // 2. Inserir pessoa_juridica
            // ===============================
            DB::table('pessoa_juridica')->insert([
                'id_pessoa_juridica' => $idPessoaFisica,
                'nip' => $request->nip,
                'id_patente' => $request->id_posto_organico,
                'id_especialidade' => $request->especialidade,
                'FPS' => $request->FPS,
                'id_situacao' => $request->id_condicao,
                'created' => now(),
            ]);

            $this->logAuditoria('pessoa_juridica', $idPessoaFisica, 'insert', $request->all());

            // ===============================
            // 3. Inserir endereco
            // ===============================
            DB::table('endereco')->insert([
                'idpessoa' => $idPessoaFisica,
                'endereco' => $request->endereco,
                'idbairro' => $request->id_bairro,
                'created' => now(),
            ]);

            // ===============================
            // 4. Inserir foto militar
            // ===============================
            if ($request->hasFile('foto_militar')) {
                $file = $request->file('foto_militar');
                if ($file->isValid()) {
                    $filename = time() . '-' . Str::slug($request->nome) . '.' . $file->getClientOriginalExtension();
                    $fotoPath = $file->storeAs('fotos', $filename, 'public');

                    DB::table('foto')->insert([
                        'id_pessoa_juridica' => $idPessoaFisica,
                        'foto_militar' => $fotoPath,
                        'created' => now(),
                    ]);
                }
            }

            // ===============================
            // 5. Incorporacoes
            // ===============================
            if (!empty($request->incorporacoes)) {
                foreach ($request->incorporacoes as $inc) {
                    if (!empty($inc['id_tipo_incorporacao']) && !empty($inc['data_incorporacao'])) {
                        DB::table('tipo_incorporacao_data')->insert([
                            'pessoa_juridica' => $idPessoaFisica,
                            'id_tipo_incorporacao' => $inc['id_tipo_incorporacao'],
                            'data_incorporacao' => $inc['data_incorporacao'],
                            'local' => $inc['local'] ?? null,
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // Histórico de progressões (posto/cargo)
            // ===============================
            if (!empty($request->ordem)) {
                foreach ($request->ordem as $index => $ordemId) {
                    DB::table('tbl_historico_progressao')->insert([
                        'idPessoa'    => $idPessoaFisica,
                        'CodPatente'  => $request->posto[$index],  // só se a ordem for de posto
                        'Cargo_por_normalizar' => $request->cargo_por_normalizar[$index],  // só se a ordem for de cargo
                        'idOrdem'     => $ordemId,                        // já carrega consigo o tipo
                        'Data_Registo' => now(),
                    ]);
                }
            }


            // ===============================
            // 8. Formação
            // ===============================
            if (!empty($request->formacao_instituicao)) {
                foreach ($request->formacao_instituicao as $index => $instituicao) {
                    if ($instituicao && !empty($request->id_curso[$index])) {
                        DB::table('curso_frequentado')->insert([
                            'id_pessoa_juridica' => $idPessoaFisica,
                            'id_instituicao' => $instituicao,
                            'id_curso' => $request->id_curso[$index],
                            'data_inicio' => $request->formacao_inicio[$index] ?? null,
                            'data_fim' => $request->formacao_fim[$index] ?? null,
                            'nota' => $request->nota[$index] ?? null,
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 9. Documentos
            // ===============================
            if (!empty($request->documentos)) {
                foreach ($request->documentos as $doc) {
                    if (!empty($doc['id_tipo_doc']) && !empty($doc['numero_doc'])) {
                        DB::table('documento')->insert([
                            'id_pessoa_fisica' => $idPessoaFisica,
                            'id_tipo_doc' => $doc['id_tipo_doc'],
                            'numero_doc' => $doc['numero_doc'],
                            'data_emissao' => $doc['data_emissao'] ?? null,
                            'data_validade' => $doc['data_validade'] ?? null,
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 10. Contactos
            // ===============================
            if (!empty($request->contactos)) {
                foreach ($request->contactos as $cont) {
                    if (!empty($cont['tipo_contacto']) && !empty($cont['contacto'])) {
                        DB::table('tbl_contactos')->insert([
                            'idPessoa' => $idPessoaFisica,
                            'tipo_contacto' => $cont['tipo_contacto'],
                            'Contacto' => $cont['contacto'],
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 11. Agregado Familiar
            // ===============================
            if (!empty($request->agregado)) {
                foreach ($request->agregado as $membro) {
                    if (!empty($membro['Nome_Agr'])) {

                        // Converter a data se existir
                        $dataNasc = !empty($membro['Data_Nasc_Agr'])
                            ? \Carbon\Carbon::parse($membro['Data_Nasc_Agr'])->format('Y-m-d') // formato MySQL
                            : null;

                        DB::table('tbl_agregado_familiar')->insert([
                            'idPessoa' => $idPessoaFisica,
                            'Nome_Agr' => $membro['Nome_Agr'],
                            'Data_Nasc_Agr' => $dataNasc,
                            'idGrauParentesco' => $membro['idGrauParentesco'] ?? null,
                            'Sexo_Agr' => $membro['Sexo_Agr'] ?? null,
                            'Provincia' => $membro['Provincia_Agr'] ?? null,
                        ]);
                    }
                }
            }


            // ===============================
            // 12. Línguas faladas
            // ===============================
            if (!empty($request->linguas)) {
                foreach ($request->linguas as $lingua) {
                    if (!empty($lingua['idLingua'])) {
                        DB::table('tbl_linguasfaladas')->insert([
                            'idPessoa' => $idPessoaFisica,
                            'idLingua' => $lingua['idLingua'],
                        ]);
                    }
                }
            }

            DB::commit();

            return redirect()->route('specialist.index')->with('success', 'Especialista cadastrado!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Erro ao criar especialista', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);
            return redirect()->back()->withInput()->with('error', 'Erro ao criar: ' . $e->getMessage());
        }
    }

    public function storeOrder(StoreOrdemRequest $request)
    {
        $dados = $request->only(['N_ORDEM', 'DATA_ORDEM', 'idEntidade', 'idTipoOrdem']);

        // Verifica duplicidade
        $existe = DB::table('tbl_ordens')
            ->where([['N_ORDEM', '=', $dados['N_ORDEM']], ['DATA_ORDEM', '=', $dados['DATA_ORDEM']], ['idEntidade', '=', $dados['idEntidade']], ['idTipoOrdem', '=', $dados['idTipoOrdem']]])
            ->exists();


        // Insere
        $dados['created'] = now();
        DB::table('tbl_ordens')->insert($dados);

        return redirect()->back()
            ->with('success', 'Ordem cadastrada com sucesso!');
    }

    public function StoreCourse(StoreCursoRequest $request)
    {
        $dados = [

            'nome_curso' => $request->nome_curso,
            'id_nivel' => $request->id_nivel_curso,
            'id_tipo_curso' => $request->id_tipo_curso,
        ];

        $inserido = DB::table('curso')->insert($dados);

        return redirect()->back()
            ->with($inserido ? 'success' : 'error', $inserido ? 'Curso cadastrado!' : 'Erro ao cadastrar curso.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // Recuperar informações do especialista
        $dadosespecialista = DB::table('pessoa_fisica')
            ->join('pessoa_juridica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->leftJoin('municipio as municipio_naturalidade', 'pessoa_fisica.id_naturalidade', '=', 'municipio_naturalidade.idmunicipio')
            ->leftJoin('estado_civil', 'pessoa_fisica.id_estado_civil', '=', 'estado_civil.id_estado_civil')
            ->leftJoin('sexo', 'pessoa_fisica.id_sexo', '=', 'sexo.id_sexo')
            ->leftJoin('dcm_postosmilitares', 'pessoa_juridica.id_patente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('especialidade', 'pessoa_juridica.id_especialidade', '=', 'especialidade.id_especialidade')
            ->leftJoin('do_unidadesmilitares as ueo_dependencia_especialidade', 'especialidade.id_dir_especialidade', '=', 'ueo_dependencia_especialidade.UnidadeID')
            ->join('dcm_classes', 'especialidade.id_quadro_especial', '=', 'dcm_classes.Classe_Id')
            ->leftJoin('tbl_cargo_pessoa', 'pessoa_juridica.id_pessoa_juridica', '=', 'tbl_cargo_pessoa.id_pessoa')
            ->leftJoin('estrutura_organica', 'tbl_cargo_pessoa.id_estrutura_organica', '=', 'estrutura_organica.id_estrutura_organica')
            ->leftJoin('tbl_dependencias', 'estrutura_organica.id_dependencia', '=', 'tbl_dependencias.id_dependencia')
            ->leftJoin('tbl_estrutura_sub_unidade', 'tbl_dependencias.id_sub_sub_filho', '=', 'tbl_estrutura_sub_unidade.id_es')
            ->leftJoin('tbl_estrutura_sub_unidade as Estrutura_Mae', 'tbl_dependencias.id_sub_unidade_mae', '=', 'Estrutura_Mae.id_es')
            ->leftJoin('do_unidadesmilitares as Unidade_Colocado', 'tbl_dependencias.id_unidade_pai', '=', 'Unidade_Colocado.UnidadeID')
            ->leftJoin('cargo', 'estrutura_organica.id_cargo', '=', 'cargo.id_cargo')
            ->leftJoin('foto', 'pessoa_juridica.id_pessoa_juridica', '=', 'foto.id_pessoa_juridica')

            ->leftJoin('do_unidadesmilitares', 'do_unidadesmilitares.UnidadeID', '=', 'tbl_dependencias.id_unidade_pai')
            ->leftJoin('tbl_regiaomilitar', 'tbl_regiaomilitar.CodRM', '=', 'do_unidadesmilitares.RM')
            ->leftJoin('do_ramos', 'do_ramos.RamoID', '=', 'tbl_regiaomilitar.RamoID')
            ->leftJoin('do_ramos AS ramo_origem', 'pessoa_juridica.Ramo_Origem', '=', 'ramo_origem.RamoID')
            ->leftJoin('dcm_situacao_quadro', 'pessoa_juridica.FPS', '=', 'dcm_situacao_quadro.Sitq_Id')
            ->leftJoin('habilitacaoLiteraria', 'habilitacaoLiteraria.habilitacao_id', '=', 'pessoa_fisica.habilitacao_id')
            ->leftJoin('tipo_incorporacao_data as tipo_incorp_data', 'pessoa_juridica.id_pessoa_juridica', '=', 'tipo_incorp_data.pessoa_juridica')
            ->leftJoin('tbl_gsanguineo', 'pessoa_fisica.Grupo_Sanguineo', '=', 'tbl_gsanguineo.idGSangue')

            ->select([
                'pessoa_fisica.id_pessoa_fisica',
                'pessoa_fisica.nome as nome',
                DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(pessoa_fisica.nome, ' ', 1), ' ', -1) as primeironome"),
                DB::raw("TRIM(SUBSTR(pessoa_fisica.nome, LOCATE(' ', pessoa_fisica.nome))) as sobrenome"),
                'pessoa_fisica.nome_pai',
                'pessoa_fisica.nome_mae',
                DB::raw("DATE_FORMAT(pessoa_fisica.Data_Nascimento, '%d/%m/%Y') as Data_Nascimento"),
                DB::raw('TIMESTAMPDIFF(YEAR, pessoa_fisica.Data_Nascimento, CURRENT_DATE) as idade'),
                'pessoa_fisica.Alcunha',
                'pessoa_fisica.Altura',
                'pessoa_fisica.Grupo_Sanguineo',
                'pessoa_fisica.Residencia',
                'pessoa_fisica.Nro_Calcado',
                'pessoa_fisica.Nro_Camisa',
                'pessoa_fisica.Nro_Calca',
                'pessoa_fisica.OutrasInformacoes',
                'habilitacaoLiteraria.habilitacao_id',
                'habilitacaoLiteraria.descricao as escolaridade',
                'municipio_naturalidade.municipio as naturalidade',
                'estado_civil.estado_civil',
                'sexo.id_sexo',
                'pessoa_juridica.nip as nip',
                'pessoa_juridica.id_patente',
                'pessoa_juridica.FPS',
                'dcm_postosmilitares.Posto as posto',
                'dcm_postosmilitares.PostoAbrev',
                DB::raw("CONCAT(situacao_servico.nome_situacao, ' - ', situacao_condicoes.descricao ) AS situacao"),
                'tbl_gsanguineo.Tipo_Sanguinio',
                'especialidade.nome_especialidade as especialidade',
                'ueo_dependencia_especialidade.Ueo as ueo_especialidade',
                'dcm_classes.Classe',
                DB::raw("DATE_FORMAT(tipo_incorp_data.data_incorporacao, '%d/%m/%Y') as Data_IngressoFaa"),
                DB::raw("
                 CONCAT(TIMESTAMPDIFF(YEAR, tipo_incorp_data.data_incorporacao, CURDATE()), ' anos e ', TIMESTAMPDIFF(MONTH, tipo_incorp_data.data_incorporacao, CURDATE()) % 12, ' meses') AS TempoServico"),
                'dcm_situacao_quadro.Situacao_Quadro',
                'dcm_situacao_quadro.Sitq_Id',
                'do_ramos.Ramo',
                'tbl_cargo_pessoa.id_pessoa',
                'ueo_dependencia_especialidade.UnidadeID as id_ueo_especialidade',
                'tbl_dependencias.id_sub_sub_filho',
                'tbl_estrutura_sub_unidade.id_es',
                'tbl_estrutura_sub_unidade.descricao_sub_unidade as sub_unidade_filho',
                'Estrutura_Mae.descricao_sub_unidade as subunidade_mae',
                'Unidade_Colocado.UnidadeID as id_uni_colocado',

                'tbl_regiaomilitar.abrev_RM',
                'do_unidadesmilitares.Ueo',
                'do_unidadesmilitares.Ueo_Abrev',

                DB::raw("CONCAT(Unidade_Colocado.Ueo, ' / ', tbl_regiaomilitar.abrev_RM) AS unidade_colocado"),
                'cargo.nome_cargo as cargo',
                DB::raw("CONCAT(cargo.nome_cargo, ' ', IF(Estrutura_Mae.visualizacao = 0, '', Estrutura_Mae.descricao_sub_unidade), ' ',
                CASE
                    WHEN tbl_estrutura_sub_unidade.id_es = 27 THEN ''
                    ELSE tbl_estrutura_sub_unidade.descricao_sub_unidade
                END ) AS cargocolocacao"),
                'foto.foto_militar',
                'dcm_classes.Classe_abv as quadro_especial',
            ])
            ->where('pessoa_fisica.id_pessoa_fisica', $id)
            ->first();

        // Check if specialist exists
        if (!$dadosespecialista) {
            return redirect()->route('specialist.index')->with('error', 'Especialista não encontrado.');
        }

        // Recuperar número do BI
        $dados_bi = DB::table('documento')
            ->where('id_pessoa_fisica', $id)
            ->where('id_tipo_doc', 1)
            ->select(['numero_doc as numero_BI', DB::raw("DATE_FORMAT(data_emissao, '%d/%m/%Y') as D_emissao_bi"), DB::raw("DATE_FORMAT(data_validade, '%d/%m/%Y') as D_validade_bi")])
            ->first();

        // Recuperar progressão de posto
        $progressaoPosto = DB::table('pessoa_juridica')
            ->join('pessoa_fisica', 'pessoa_juridica.id_pessoa_juridica', '=', 'pessoa_fisica.id_pessoa_fisica')
            ->leftJoin('tbl_historico_progressao', 'pessoa_juridica.id_pessoa_juridica', '=', 'tbl_historico_progressao.idPessoa')
            ->join('tbl_ordens', 'tbl_historico_progressao.idOrdem', '=', 'tbl_ordens.id')
            ->join('tbl_entidade', 'tbl_ordens.idEntidade', '=', 'tbl_entidade.id_entidade')
            ->join('tbl_tipoordem', 'tbl_ordens.idTipoOrdem', '=', 'tbl_tipoordem.CodTipoOrdem')
            ->join('dcm_postosmilitares', 'tbl_historico_progressao.CodPatente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('cargo', 'tbl_historico_progressao.Cargo_id', '=', 'cargo.id_cargo')
            ->where('pessoa_fisica.id_pessoa_fisica', $id)
            ->whereIn('tbl_tipoordem.Grupo_tipo_ordem', [1, 3])
            ->select([
                'pessoa_juridica.nip',
                'pessoa_fisica.nome',
                'tbl_historico_progressao.Data_Registo',
                DB::raw('COALESCE(cargo.nome_cargo, tbl_historico_progressao.Cargo_por_normalizar) AS cargo_exercido'),
                'tbl_ordens.N_ORDEM',
                'tbl_tipoordem.Descricao_tipo_ordem',
                'tbl_tipoordem.CodTipoOrdem',
                'tbl_tipoordem.TipoAbrev',
                'tbl_entidade.Entidade_Abrev',
                'dcm_postosmilitares.Posto AS posto_exercido_passado',
                'tbl_historico_progressao.idPessoa',
                'tbl_historico_progressao.idOrdem',
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%Y') as ano"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%m') as mes"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%d') as dia")
            ])
            ->orderBy('tbl_ordens.DATA_ORDEM', 'DESC')
            ->get();


        // Recuperar progressão de cargo
        $progressaoCargo = DB::table('pessoa_juridica')
            ->join('pessoa_fisica', 'pessoa_juridica.id_pessoa_juridica', '=', 'pessoa_fisica.id_pessoa_fisica')
            ->leftJoin('tbl_historico_progressao', 'pessoa_juridica.id_pessoa_juridica', '=', 'tbl_historico_progressao.idPessoa')
            ->join('tbl_ordens', 'tbl_historico_progressao.idOrdem', '=', 'tbl_ordens.id')
            ->join('tbl_entidade', 'tbl_ordens.idEntidade', '=', 'tbl_entidade.id_entidade')
            ->join('tbl_tipoordem', 'tbl_ordens.idTipoOrdem', '=', 'tbl_tipoordem.CodTipoOrdem')
            ->join('dcm_postosmilitares', 'tbl_historico_progressao.CodPatente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('cargo', 'tbl_historico_progressao.Cargo_id', '=', 'cargo.id_cargo')
            ->where('pessoa_fisica.id_pessoa_fisica', $id)
            ->whereIn('tbl_tipoordem.Grupo_tipo_ordem', [2, 3])
            ->select([
                'pessoa_juridica.nip',
                'pessoa_fisica.nome',
                'tbl_historico_progressao.Data_Registo',
                DB::raw('COALESCE(cargo.nome_cargo, tbl_historico_progressao.Cargo_por_normalizar) AS cargo_exercido'),
                'tbl_ordens.N_ORDEM',
                'tbl_tipoordem.Descricao_tipo_ordem',
                'tbl_tipoordem.CodTipoOrdem',
                'tbl_tipoordem.TipoAbrev',
                'tbl_entidade.Entidade_Abrev',
                'dcm_postosmilitares.Posto AS posto_exercido_passado',
                'tbl_historico_progressao.idPessoa',
                'tbl_historico_progressao.idOrdem',
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%Y') as ano"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%m') as mes"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%d') as dia")
            ])
            ->orderBy('tbl_ordens.DATA_ORDEM', 'DESC')
            ->get();

        // Recuperar outras progressões
        $outrasProgressoes = DB::table('pessoa_juridica')
            ->join('pessoa_fisica', 'pessoa_juridica.id_pessoa_juridica', '=', 'pessoa_fisica.id_pessoa_fisica')
            ->leftJoin('tbl_historico_progressao', 'pessoa_juridica.id_pessoa_juridica', '=', 'tbl_historico_progressao.idPessoa')
            ->join('tbl_ordens', 'tbl_historico_progressao.idOrdem', '=', 'tbl_ordens.id')
            ->join('tbl_entidade', 'tbl_ordens.idEntidade', '=', 'tbl_entidade.id_entidade')
            ->join('tbl_tipoordem', 'tbl_ordens.idTipoOrdem', '=', 'tbl_tipoordem.CodTipoOrdem')
            ->join('dcm_postosmilitares', 'tbl_historico_progressao.CodPatente', '=', 'dcm_postosmilitares.Posto_Id')
            ->leftJoin('cargo', 'tbl_historico_progressao.Cargo_id', '=', 'cargo.id_cargo')
            ->where('pessoa_fisica.id_pessoa_fisica', $id)
            ->whereIn('tbl_tipoordem.Grupo_tipo_ordem', [4, 5])
            ->select([
                'pessoa_juridica.nip',
                'pessoa_fisica.nome',
                'tbl_historico_progressao.Data_Registo',
                DB::raw('COALESCE(cargo.nome_cargo, tbl_historico_progressao.Cargo_por_normalizar) AS cargo_exercido'),
                'tbl_ordens.N_ORDEM',
                'tbl_tipoordem.Descricao_tipo_ordem',
                'tbl_tipoordem.CodTipoOrdem',
                'tbl_tipoordem.TipoAbrev',
                'tbl_entidade.Entidade_Abrev',
                'dcm_postosmilitares.Posto AS posto_exercido_passado',
                'tbl_historico_progressao.idPessoa',
                'tbl_historico_progressao.idOrdem',
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%Y') as ano"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%m') as mes"),
                DB::raw("DATE_FORMAT(tbl_ordens.DATA_ORDEM, '%d') as dia")
            ])
            ->orderBy('tbl_ordens.DATA_ORDEM', 'DESC')
            ->get();


        // Recuperar agregado familiar
        $agregadoFamiliar = DB::table('tbl_agregado_familiar')
            ->leftJoin('tbl_grauparentesco', 'tbl_agregado_familiar.idGrauParentesco', '=', 'tbl_grauparentesco.idGParentesco')
            ->leftJoin('provincia', 'tbl_agregado_familiar.Provincia', '=', 'provincia.idprovincia')
            ->where('tbl_agregado_familiar.idPessoa', $id)
            ->select([
                'tbl_agregado_familiar.Nome_Agr',
                DB::raw("DATE_FORMAT(tbl_agregado_familiar.Data_Nasc_Agr, '%d/%m/%Y') as data_nasc"),
                'tbl_grauparentesco.Parentesco',
                'tbl_agregado_familiar.Sexo_Agr',
                'provincia.provincia as Provincia'
            ])
            ->orderBy('tbl_agregado_familiar.Data_Nasc_Agr')
            ->get();

        // Recuperar contatos
        $contactos = DB::table('tbl_contactos')
            ->join('tbl_tipo_contacto', 'tbl_contactos.tipo_contacto', '=', 'tbl_tipo_contacto.idTipoContactos')
            ->where('tbl_contactos.idPessoa', $id)
            ->select(['tbl_contactos.Contacto', 'tbl_tipo_contacto.tipoContacto'])
            ->orderBy('tbl_tipo_contacto.idTipoContactos')
            ->get();

        // Recuperar formações
        $formacoes = DB::table('curso_frequentado')
            ->join('curso', 'curso_frequentado.id_curso', '=', 'curso.id_curso')
            ->join('nivel_curso', 'curso.id_nivel', '=', 'nivel_curso.id_nivel_curso')
            ->join('tipo_curso', 'curso.id_tipo_curso', '=', 'tipo_curso.id_tipo_curso')
            ->join('instituicao', 'curso_frequentado.id_instituicao', '=', 'instituicao.id_instituicao')
            ->join('pais', 'instituicao.id_pais', '=', 'pais.id_pais')
            ->where('curso_frequentado.id_pessoa_juridica', $id)
            ->select(['curso.nome_curso', DB::raw("DATE_FORMAT(curso_frequentado.data_inicio, '%m/%Y') as data_inicio"), DB::raw("DATE_FORMAT(curso_frequentado.data_fim, '%m/%Y') as data_fim"), 'nivel_curso.nive_curso', 'tipo_curso.tipo_curso', 'instituicao.nome_instituicao', 'pais.nome_pais', 'curso_frequentado.nota'])
            ->get();

        // Recuperar documentos
        $docs = DB::table('documento')
            ->join('tipo_documento', 'documento.id_tipo_doc', '=', 'tipo_documento.id_tipo_doc')
            ->where('documento.id_pessoa_fisica', $id)
            ->select(['tipo_documento.nome_doc', 'documento.numero_doc', DB::raw("DATE_FORMAT(documento.data_emissao, '%d/%m/%Y') as data_emissao"), DB::raw("DATE_FORMAT(documento.data_validade, '%d/%m/%Y') as data_validade")])
            ->get();


        //Recuperar Endereço
        $enderecos = DB::table('qry_endereco_completo')
            ->select('endereco_completo')
            ->where('idPessoa', $id)
            ->first();

        // Recuperar tipos de incorporação
        $incorporacoes = DB::table('tipo_incorporacao_data')
            ->join('tipo_incorporacao', 'tipo_incorporacao_data.id_tipo_incorporacao', '=', 'tipo_incorporacao.id_tipo')
            ->leftJoin('provincia', 'tipo_incorporacao_data.local', '=', 'provincia.idprovincia')
            ->where('tipo_incorporacao_data.pessoa_juridica', $id)
            ->select(['tipo_incorporacao.nome', 'tipo_incorporacao_data.local', 'provincia.provincia', DB::raw("DATE_FORMAT(tipo_incorporacao_data.data_incorporacao, '%d/%m/%Y') as data_incorporacao")])
            ->get();

        //
        // Recuperar línguas estrangeiras
        $linguasE = DB::table('tbl_linguasfaladas')
            ->join('tbl_tipos_linguas', 'tbl_linguasfaladas.idLingua', '=', 'tbl_tipos_linguas.idLingua')
            ->where('tbl_linguasfaladas.idPessoa', $id)
            ->where('tbl_tipos_linguas.grupoLingua', 2)
            ->select(['tbl_tipos_linguas.descricaoLingua'])
            ->get();

        // Recuperar línguas nacionais
        $linguasN = DB::table('tbl_linguasfaladas')
            ->join('tbl_tipos_linguas', 'tbl_linguasfaladas.idLingua', '=', 'tbl_tipos_linguas.idLingua')
            ->where('tbl_linguasfaladas.idPessoa', $id)
            ->where('tbl_tipos_linguas.grupoLingua', 1)
            ->select(['tbl_tipos_linguas.descricaoLingua'])
            ->get();

        // Recuperar dados de reformados
        $reformados = DB::table('qry_reformados_nova')
            ->where('id_pessoa_fisica', $id)
            ->select(['nome', 'nip', 'idade', 'tempo_servico', 'PostoAbrev', 'unidade_colocado', 'cargo', 'foto_militar', DB::raw("DATE_FORMAT(Data_Incorporacao, '%d/%m/%Y') AS Data_Incorporacao"), DB::raw("DATE_FORMAT(Data_Nascimento, '%d/%m/%Y') AS Data_Nascimento"), 'LIMITE_IDADE AS data_reforma_idade', 'TSM AS ano_reforma_tempo_servico'])
            ->first();

        $reforma = [];

        if ($dadosespecialista->FPS === 'P') {
            $reforma = [
                [
                    'label' => 'Reforma por TSM:',
                    'valor' => $reformados->ano_reforma_tempo_servico ?? 'Não informado',
                ],
                [
                    'label' => 'Reforma por Idade:',
                    'valor' => $reformados->data_reforma_idade ?? 'Não informado',
                ],
            ];
        } elseif (in_array($dadosespecialista->FPS, ['O', 'M'])) {
            $reforma = [
                [
                    'label' => 'Reserva por TSM:',
                    'valor' => $reformados->ano_reforma_tempo_servico ?? 'Não informado',
                ],
            ];
        }

        return view('specialists.show', [
            'especialista'     => $dadosespecialista,
            'historicoPosto'   => $progressaoPosto,
            'historicoCargo'   => $progressaoCargo,
            'historicoOutro'        => $outrasProgressoes,
            'agregado_familiar' => $agregadoFamiliar,
            'contactos'        => $contactos,
            'formacoes'        => $formacoes,
            'docs'             => $docs,
            'dados_bi'         => $dados_bi,
            'linguasE'         => $linguasE,
            'linguasN'         => $linguasN,
            'incorporacoes'    => $incorporacoes,
            'reforma'          => $reforma, // 👈 já processado
            'endereco'         => $enderecos,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */

    public function edit(string $id)
    {
        // Recuperar o especialista específico
        $specialist = DB::table('pessoa_fisica')
            ->leftJoin('pessoa_juridica', 'pessoa_fisica.id_pessoa_fisica', '=', 'pessoa_juridica.id_pessoa_juridica')
            ->leftJoin('especialidade', 'pessoa_juridica.id_especialidade', '=', 'especialidade.id_especialidade')
            ->leftJoin('dcm_classes', 'especialidade.id_quadro_especial', '=', 'dcm_classes.Classe_Id')
            ->leftJoin('situacao_condicoes', 'pessoa_juridica.id_situacao', '=', 'situacao_condicoes.id')
            ->leftJoin('situacao_servico', 'situacao_condicoes.id_situacao', '=', 'situacao_servico.id_situacao')
            ->leftJoin('habilitacaoLiteraria', 'pessoa_fisica.habilitacao_id', '=', 'habilitacaoLiteraria.habilitacao_id')
            ->leftJoin('endereco', 'pessoa_fisica.id_pessoa_fisica', '=', 'endereco.idpessoa')
            ->leftJoin('bairro', 'endereco.idbairro', '=', 'bairro.idbairro')
            ->leftJoin('zona', 'bairro.idzona', '=', 'zona.idzona')
            ->leftJoin('municipio as municipio_nasc', 'pessoa_fisica.id_naturalidade', '=', 'municipio_nasc.idmunicipio')
            ->leftJoin('provincia as provincia_nasc', 'municipio_nasc.idprovincia', '=', 'provincia_nasc.idprovincia')
            ->leftJoin('municipio', 'zona.idmunicipio', '=', 'municipio.idmunicipio')
            ->leftJoin('provincia', 'municipio.idprovincia', '=', 'provincia.idprovincia')
            ->where('pessoa_fisica.id_pessoa_fisica', $id)
            ->select([
                'pessoa_fisica.*',
                'pessoa_juridica.*',
                'especialidade.id_quadro_especial',
                'dcm_classes.Classe',
                'pessoa_juridica.id_situacao as id_condicao',
                'situacao_servico.id_situacao as id_situacao_servico',
                'situacao_servico.nome_situacao',
                'habilitacaoLiteraria.descricao',
                'endereco.endereco',
                'bairro.bairro',
                'bairro.idbairro',
                'zona.zona',
                'zona.idzona',
                'municipio.municipio',
                'municipio.idmunicipio',
                'provincia.provincia',
                'provincia.idprovincia',
                'municipio_nasc.municipio as municipio_nascimento',
                'municipio_nasc.idmunicipio as id_municipio_nascimento',
                'provincia_nasc.provincia as provincia_nascimento',
                'provincia_nasc.idprovincia as id_provincia_nascimento'
            ])
            ->first();

        if (!$specialist) {
            return redirect()->route('specialist.index')->with('error', 'Especialista não encontrado.');
        }

        // Dados auxiliares
        $postos = DB::table('dcm_postosmilitares')->orderBy('Posto_Id')->get();
        $quadroEspecial = DB::table('dcm_classes')->orderBy('Classe')->get();
        $especialidades = DB::table('especialidade')->orderBy('id_especialidade')->get();
        $fps = DB::table('dcm_situacao_quadro')->orderBy('Sitq_Id')->get();
        $sexos = DB::table('sexo')->orderBy('id_sexo')->get();
        $estadosCivis = DB::table('estado_civil')->orderBy('estado_civil')->get();
        $tiposDocumento = DB::table('tipo_documento')->orderBy('id_tipo_doc')->get();
        $grupoSanguineo = DB::table('tbl_gsanguineo')->orderBy('idGSangue')->get();
        $tiposContacto = DB::table('tbl_tipo_contacto')->orderBy('idTipoContactos')->get();
        $provincias = DB::table('provincia')->orderBy('idprovincia')->get();
        $municipios = DB::table('municipio')->orderBy('idmunicipio')->get();
        $zonas = DB::table('zona')->orderBy('idzona')->get();
        $bairros = DB::table('bairro')->orderBy('idbairro')->get();
        $habilitacoes = DB::table('habilitacaoLiteraria')->orderBy('habilitacao_id')->get();
        $instituicoes = DB::table('instituicao')->orderBy('id_instituicao')->get();
        $niveis = DB::table('nivel_curso')->orderBy('id_nivel_curso')->get();
        $paises = DB::table('pais')->orderBy('id_pais')->get();
        $cursos = DB::table('curso')->orderBy('id_curso')->get();
        $tipo_Incorporacao = DB::table('tipo_incorporacao')->orderBy('id_tipo')->get();
        $situacaoServico = DB::table('situacao_servico')->orderBy('id_situacao')->get();
        $condicoesMilitares = DB::table('situacao_condicoes')->orderBy('id')->get();
        $do_ramos = DB::table('do_ramos')->orderBy('RamoID')->get();
        $cargos = DB::table('cargo')->orderBy('id_cargo')->get();
        $grausParentesco = DB::table('tbl_grauparentesco')->orderBy('idGParentesco')->get();
        $linguas = DB::table('tbl_tipos_linguas')->orderBy('idLingua')->get();
        $tipoLinguas = DB::table('tbl_grupo_lingua')->orderBy('id_grupo_lingua')->get();
        $tipo_ordem = DB::table('tbl_tipoordem')->orderBy('CodTipoOrdem')->get();
        $tipo_curso = DB::table('tipo_curso')->get();


        // Dados relacionados
        $specialist->incorporacoes = DB::table('tipo_incorporacao_data')->where('pessoa_juridica', $specialist->id_pessoa_juridica)->get();


        //Ordens de Progressão

        $entidades = DB::table('tbl_entidade')->where('estado', '=', ' 1')->get();
        $tiposOrdem = DB::table('tbl_tipoordem')->get();

        $ordens = DB::table('tbl_ordens')
            ->join('tbl_entidade', 'tbl_ordens.idEntidade', '=', 'tbl_entidade.id_entidade')
            ->join('tbl_tipoordem', 'tbl_ordens.idTipoOrdem', '=', 'tbl_tipoordem.CodTipoOrdem')
            ->select(
                'tbl_ordens.id',
                'tbl_ordens.N_ORDEM',
                'tbl_ordens.DATA_ORDEM',
                'tbl_entidade.Entidade_Abrev',
                'tbl_tipoordem.Descricao_tipo_ordem'
            )
            ->get()
            ->map(function ($ordem) {
                $data = \Carbon\Carbon::parse($ordem->DATA_ORDEM)->locale('pt_BR');
                $ordem->referencia_ordem =
                    $ordem->N_ORDEM . '/' .
                    $ordem->Entidade_Abrev . '/' .
                    $data->year . ', de ' . $data->day . ' de ' . $data->translatedFormat('F');
                return $ordem;
            });


        $specialist->historicos = DB::table('tbl_historico_progressao as h')
            ->join('tbl_ordens as o', 'h.idOrdem', '=', 'o.id')
            ->join('tbl_tipoordem as t', 'o.idTipoOrdem', '=', 't.CodTipoOrdem')
            ->where('h.idPessoa', $specialist->id_pessoa_juridica)
            ->select([
                'h.CodPatente as id_posto',
                'h.Cargo_por_normalizar as cargo',
                'h.Cargo_id as id_cargo',
                'h.idOrdem as id_ordem',
                't.CodTipoOrdem as id_tipo_ordem'
            ])
            ->get();

        $specialist->formacoes = DB::table('curso_frequentado')->where('id_pessoa_juridica', $specialist->id_pessoa_juridica)->get();

        $specialist->documentos = DB::table('documento')->where('id_pessoa_fisica', $specialist->id_pessoa_fisica)->get();

        $specialist->contactos = DB::table('tbl_contactos')->where('idPessoa', $specialist->id_pessoa_fisica)->get();

        $specialist->agregados = DB::table('tbl_agregado_familiar')->where('idPessoa', $specialist->id_pessoa_fisica)->get();

        $specialist->fotos = DB::table('foto')->where('id_pessoa_juridica', $specialist->id_pessoa_juridica)->get();

        $specialist->linguasFaladas = DB::table('tbl_linguasfaladas')
            ->join('tbl_tipos_linguas', 'tbl_linguasfaladas.idLingua', '=', 'tbl_tipos_linguas.idLingua')
            ->where('tbl_linguasfaladas.idPessoa', $specialist->id_pessoa_fisica)
            ->select(['tbl_linguasfaladas.idLingua', 'tbl_tipos_linguas.grupoLingua'])
            ->get();

        $linguasPorGrupo = [];
        foreach ($tipoLinguas as $grupo) {
            $linguasPorGrupo[$grupo->id_grupo_lingua] = DB::table('tbl_tipos_linguas')->where('grupoLingua', $grupo->id_grupo_lingua)->orderBy('descricaoLingua')->get();
        }



        return view('specialists.edit', compact('specialist', 'postos', 'provincias', 'quadroEspecial', 'fps', 'sexos', 'estadosCivis', 'habilitacoes', 'tiposDocumento', 'grupoSanguineo', 'tiposContacto', 'municipios', 'situacaoServico', 'condicoesMilitares', 'do_ramos', 'instituicoes', 'niveis', 'paises', 'cursos', 'tipo_Incorporacao', 'zonas', 'bairros', 'ordens', 'cargos', 'grausParentesco', 'especialidades', 'linguas', 'tipoLinguas', 'linguasPorGrupo', 'tipo_ordem', 'entidades', 'tiposOrdem', 'tipo_curso'));
    }

    /**
     * Update the specified resource in storage.
     */

    public function update(SpecialistRequest $request, $id)
    {
        DB::beginTransaction();

        try {
            // ===============================
            // 1. Atualizar pessoa_fisica
            // ===============================
            DB::table('pessoa_fisica')
                ->where('id_pessoa_fisica', $id)
                ->update([
                    'nome' => $request->nome,
                    'Alcunha' => $request->alcunha,
                    'Data_Nascimento' => $request->data_nascimento,
                    'id_sexo' => $request->id_sexo,
                    'id_estado_civil' => $request->id_estado_civil,
                    'id_naturalidade' => $request->idmunicipio,
                    'nome_pai' => $request->nome_pai,
                    'nome_mae' => $request->nome_mae,
                    'Grupo_Sanguineo' => $request->grupo_sanguineo,
                    'Altura' => $request->altura,
                    'Nro_Calcado' => $request->Nro_Calcado,
                    'Nro_Camisa' => $request->Nro_Camisa,
                    'Nro_Calca' => $request->Nro_Calca,
                    'habilitacao_id' => $request->habilitacao_id,
                    'modify' => now(),
                ]);

            // ===============================
            // 2. Atualizar pessoa_juridica
            // ===============================
            DB::table('pessoa_juridica')
                ->where('id_pessoa_juridica', $id)
                ->update([
                    'nip' => $request->nip,
                    'id_patente' => $request->id_posto_organico,
                    'id_especialidade' => $request->especialidade,
                    'FPS' => $request->FPS,
                    'id_situacao'     => $request->id_condicao,   // <- Condição militar (corrigido)
                    'modify' => now(),
                ]);
            // Se a situação NÃO for ativa-Comissão Normal de Serviço (1), remover da tabela cargo_pessoa

            if ($request->id_situacao != 1) {
                $exists = DB::table('tbl_cargo_pessoa')
                    ->where('id_pessoa', $id)
                    ->exists();

                if ($exists) {
                    DB::table('tbl_cargo_pessoa')
                        ->where('id_pessoa', $id)
                        ->delete();
                }
            }


            // ===============================
            // 3. Atualizar endereco
            // ===============================
            DB::table('endereco')->updateOrInsert(
                ['idpessoa' => $id],
                [
                    'endereco' => $request->endereco,
                    'idbairro' => $request->id_bairro,
                    'modify' => now(),
                ],
            );

            // ===============================
            // 4. Foto militar
            // ===============================
            if ($request->hasFile('foto_militar')) {
                $file = $request->file('foto_militar');
                if ($file->isValid()) {
                    $filename = time() . '-' . Str::slug($request->nome) . '.' . $file->getClientOriginalExtension();
                    $fotoPath = $file->storeAs('fotos', $filename, 'public');

                    DB::table('foto')->updateOrInsert(
                        ['id_pessoa_juridica' => $id],
                        [
                            'foto_militar' => $fotoPath,
                        ],
                    );
                }
            }

            // ===============================
            // 5. Incorporacao
            // ===============================
            DB::table('tipo_incorporacao_data')->where('pessoa_juridica', $id)->delete();
            if (!empty($request->incorporacoes)) {
                foreach ($request->incorporacoes as $inc) {
                    if (!empty($inc['id_tipo_incorporacao']) && !empty($inc['data_incorporacao'])) {
                        DB::table('tipo_incorporacao_data')->insert([
                            'pessoa_juridica' => $id,
                            'id_tipo_incorporacao' => $inc['id_tipo_incorporacao'],
                            'data_incorporacao' => $inc['data_incorporacao'],
                            'local' => $inc['local'] ?? null,
                            'created' => now(),
                            'modify' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // Histórico de progressões (posto/cargo)
            // ===============================
            DB::table('tbl_historico_progressao')->where('idPessoa', $id)->delete();

            if (!empty($request->ordem)) {
                foreach ($request->ordem as $index => $ordemId) {
                    DB::table('tbl_historico_progressao')->insert([
                        'idPessoa'     => $id,
                        'CodPatente'   => $request->posto[$index] ?? null,
                        'Cargo_por_normalizar'     => $request->cargo_por_normalizar[$index] ?? null,
                        'idOrdem'      => $ordemId,
                        'Data_Registo' => now(),
                    ]);
                }
            }


            // ===============================
            // 7. Formação
            // ===============================
            DB::table('curso_frequentado')->where('id_pessoa_juridica', $id)->delete();
            if (!empty($request->formacao_instituicao)) {
                foreach ($request->formacao_instituicao as $index => $instituicao) {
                    if ($instituicao && !empty($request->id_curso[$index])) {
                        DB::table('curso_frequentado')->insert([
                            'id_pessoa_juridica' => $id,
                            'id_instituicao' => $instituicao,
                            'id_curso' => $request->id_curso[$index],
                            'data_inicio' => $request->formacao_inicio[$index] ?? null,
                            'data_fim' => $request->formacao_fim[$index] ?? null,
                            'nota' => $request->nota[$index] ?? null,
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 8. Documentos
            // ===============================
            DB::table('documento')->where('id_pessoa_fisica', $id)->delete();
            if (!empty($request->documentos)) {
                foreach ($request->documentos as $doc) {
                    if (!empty($doc['id_tipo_doc']) && !empty($doc['numero_doc'])) {
                        DB::table('documento')->insert([
                            'id_pessoa_fisica' => $id,
                            'id_tipo_doc' => $doc['id_tipo_doc'],
                            'numero_doc' => $doc['numero_doc'],
                            'data_emissao' => $doc['data_emissao'] ?? null,
                            'data_validade' => $doc['data_validade'] ?? null,
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 9. Contactos
            // ===============================
            DB::table('tbl_contactos')->where('idPessoa', $id)->delete();
            if (!empty($request->contactos)) {
                foreach ($request->contactos as $cont) {
                    if (!empty($cont['tipo_contacto']) && !empty($cont['contacto'])) {
                        DB::table('tbl_contactos')->insert([
                            'idPessoa' => $id,
                            'tipo_contacto' => $cont['tipo_contacto'],
                            'Contacto' => $cont['contacto'],
                            'created' => now(),
                        ]);
                    }
                }
            }

            // ===============================
            // 10. Agregado Familiar
            // ===============================
            DB::table('tbl_agregado_familiar')->where('idPessoa', $id)->delete();

            if (!empty($request->agregado)) {
                foreach ($request->agregado as $membro) {
                    if (!empty($membro['Nome_Agr'])) {

                        // Converter a data se existir
                        $dataNasc = !empty($membro['Data_Nasc_Agr'])
                            ? \Carbon\Carbon::parse($membro['Data_Nasc_Agr'])->format('Y-m-d') // padrão MySQL
                            : null;

                        DB::table('tbl_agregado_familiar')->insert([
                            'idPessoa' => $id,
                            'Nome_Agr' => $membro['Nome_Agr'],
                            'Data_Nasc_Agr' => $dataNasc,
                            'idGrauParentesco' => $membro['idGrauParentesco'] ?? null,
                            'Sexo_Agr' => $membro['Sexo_Agr'] ?? null,
                            'Provincia' => $membro['Provincia_Agr'] ?? null,
                        ]);
                    }
                }
            }


            // ===============================
            // 11. Línguas faladas
            // ===============================
            DB::table('tbl_linguasfaladas')->where('idPessoa', $id)->delete();
            if (!empty($request->linguas)) {
                foreach ($request->linguas as $lingua) {
                    if (!empty($lingua['idLingua'])) {
                        DB::table('tbl_linguasfaladas')->insert([
                            'idPessoa' => $id,
                            'idLingua' => $lingua['idLingua'],
                        ]);
                    }
                }
            }

            DB::commit();

            return redirect()->route('specialist.show', ['id' => $id])->with('success', 'Dados do Especialista actualizados!');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Erro ao atualizar especialista', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);
            return redirect()
                ->back()
                ->withInput()
                ->with('error', 'Erro ao actualizar: ' . $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            // Verifica se a pessoa existe
            $pessoa = DB::table('pessoa_fisica')->where('id_pessoa_fisica', $id)->first();

            if (!$pessoa) {
                return redirect()->route('specialist.index')->with('error', 'Especialista não encontrado.');
            }

            // Impede a exclusão se o utilizador for Oficial da RPSI
            if (auth()->user()->hasRole('Oficial da RPSI')) {
                return back()->with('error', 'Não tem permissão para remover o registo.');
            }


            // Deleta a pessoa
            DB::table('pessoa_fisica')->where('id_pessoa_fisica', $id)->delete();

            return redirect()->route('specialist.index')->with('success', 'Registo removido com sucesso!');
        } catch (\Exception $e) {
            return redirect()->route('specialist.index')->with('error', 'Erro ao remover o registo!');
        }
    }


    public function ficha($id)
    {
        // Reutiliza os mesmos dados do método show
        $dados = $this->show($id)->getData();

        return view('specialists.ficha', [
            'especialista'     => $dados['especialista'],
            'historicoPosto'   => $dados['historicoPosto'],
            'historicoCargo'   => $dados['historicoCargo'],
            'historicoOutro'   => $dados['historicoOutro'],
            'agregado_familiar' => $dados['agregado_familiar'],
            'contactos'        => $dados['contactos'],
            'formacoes'        => $dados['formacoes'],
            'docs'             => $dados['docs'],
            'dados_bi'         => $dados['dados_bi'],
            'linguasE'         => $dados['linguasE'],
            'linguasN'         => $dados['linguasN'],
            'incorporacoes'    => $dados['incorporacoes'],
            'reforma'          => $dados['reforma'],
            'endereco'         => $dados['endereco'],
            'title'            => 'Ficha Individual do Especialista',
        ]);
    }
}
