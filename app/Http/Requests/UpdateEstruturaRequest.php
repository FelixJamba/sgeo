<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateEstruturaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
     public function rules()
{
    return [
        'id_regiao' => 'required|exists:tbl_regiaomilitar,CodRM',
        'id_pai' => 'required|exists:tbl_estrutura_sub_unidade,id_es',
        'id_sub_unidade_mae' => 'required|exists:tbl_estrutura_sub_unidade,id_es',
        'id_sub_unidade_filho' => 'required|exists:tbl_estrutura_sub_unidade,id_es',
        'id_funcao' => 'required|exists:funcao,id_funcao',
        'id_cargo' => 'required|exists:cargo,id_cargo',
        'principal_cargo' => 'required|in:0,1',
        'qtd_org' => 'required|numeric',
        'id_posto_organico' => 'required|exists:dcm_postosmilitares,Posto_Id',
    ];
}
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
