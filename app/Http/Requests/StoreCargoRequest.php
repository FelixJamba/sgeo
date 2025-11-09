<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCargoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nome_cargo' => 'required|string|max:255',
            'id_funcao' => 'required|exists:funcao,id_funcao',
        ];
    }

    public function messages(): array
    {
        return [
            'nome_cargo.required' => 'O nome do cargo é obrigatório.',
            'id_funcao.required' => 'A função é obrigatória.',
            'id_funcao.exists' => 'A função selecionada é inválida.',
        ];
    }
}
