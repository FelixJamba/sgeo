<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreOrdemRequest extends FormRequest
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
    public function rules(): array
    {
         return [
        'N_ORDEM' => [
            'required',
            'string',
            'max:255',
            Rule::unique('tbl_ordens')->where(function ($query) {
                return $query->where('DATA_ORDEM', $this->DATA_ORDEM)
                             ->where('idEntidade', $this->idEntidade)
                             ->where('idTipoOrdem', $this->idTipoOrdem);
            }),
        ],
        'DATA_ORDEM' => 'required|date',
        'idEntidade' => 'required|integer|exists:tbl_entidade,id_entidade',
        'idTipoOrdem' => 'required|integer|exists:tbl_tipoordem,CodTipoOrdem',
        ];
    }
    public function messages()
    {
        return [
        'N_ORDEM.required' => 'O número da ordem é obrigatório.',
        'N_ORDEM.unique' => 'Já existe uma ordem com os mesmos dados!',
        'DATA_ORDEM.required' => 'A data da ordem é obrigatória.',
        'idEntidade.required' => 'A entidade da ordem é obrigatória.',
        'idTipoOrdem.required' => 'O tipo da ordem é obrigatório.',
        'idEntidade.exists' => 'Entidade inválida.',
        'idTipoOrdem.exists' => 'Tipo de ordem inválido.',
        ];
    }
}
