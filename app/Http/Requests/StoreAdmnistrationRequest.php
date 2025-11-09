<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAdmnistrationRequest extends FormRequest
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
            'descricao_sub_unidade' => 'required|string|max:255',
            'id_tipo' => 'required|exists:tbl_tipo_subunidade,id_tipo_subunidade',
            
        ];
    }

    public function messages()
    {
        return [
            'descricao_sub_unidade.required' => 'A descrição da subunidade é obrigatória.',
            'id_tipo.required' => 'O tipo de subunidade é obrigatório.',
            'id_tipo.exists' => 'O tipo de subunidade selecionado é inválido.',
        ];
    }
}

