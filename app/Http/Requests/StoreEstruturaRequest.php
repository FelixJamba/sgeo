<?php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreEstruturaRequest extends FormRequest
{
    /**
     * Determine se o usuário está autorizado a fazer essa solicitação.
     *
     * @return bool
     */
    public function authorize()
    {
        return true; // Aqui você pode verificar se o usuário tem permissão para fazer essa solicitação
    }

    /**
     * Obtenha as regras de validação que devem ser aplicadas à solicitação.
     *
     * @return array
     */
     public function rules(): array
{
    return [
        'id_regiao' => 'required|exists:tbl_regiaomilitar,CodRM', // Verifica se existe na tabela tbl_regiaomilitar
        'id_pai' => 'required|exists:do_unidadesmilitares,UnidadeID', // Verifica se existe na tabela do_unidadesmilitares
        'id_sub_unidade_mae' => 'required|exists:tbl_estrutura_sub_unidade,id_es', // Verifica se existe na tabela tbl_estrutura_sub_unidade
        'id_sub_unidade_filho' => 'required|exists:tbl_estrutura_sub_unidade,id_es', // Verifica se existe na tabela tbl_estrutura_sub_unidade
        'id_funcao' => 'required|exists:funcao,id_funcao', // Verifica se existe na tabela funcao
        'id_cargo' => 'required|exists:cargo,id_cargo', // Verifica se existe na tabela cargo
        'principal_cargo' => 'required|in:0,1', // Verifica se é 0 ou 1
        'qtd_org' => 'required|numeric', // Verifica se é um número
        'id_posto_organico' => 'required|exists:dcm_postosmilitares,Posto_Id', // Verifica se existe na tabela dcm_postosmilitares
    ];
}

    /**
     * Obtenha as mensagens de erro personalizadas para as regras de validação.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'id_regiao.required' => 'O campo "Região" é obrigatório.',
            'id_pai.required' => 'O campo "UEO" é obrigatório.',
            'id_sub_unidade_mae.required' => 'O campo "UEO de Escalão Superior" é obrigatório.',
            'id_sub_unidade_filho.required' => 'O campo "UEO de Escalão Inferior" é obrigatório.',
            'id_funcao.required' => 'O campo "Função" é obrigatório.',
            'id_cargo.required' => 'O campo "Cargo" é obrigatório.',
            'principal_cargo.required' => 'O campo "Cargo Principal" é obrigatório.',
            'qtd_org.required' => 'O campo "Quantidade de Orgânica" é obrigatório.',
            'id_posto_organico.required' => 'O campo "Posto Orgânico" é obrigatório.',
        ];
    }
}
