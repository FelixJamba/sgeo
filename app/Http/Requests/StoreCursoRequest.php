<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCursoRequest extends FormRequest
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
            'nome_curso' => 'required|string|max:255',
            'id_nivel_curso' => 'required|exists:nivel_curso,id_nivel_curso',
            'id_tipo_curso' => 'required|exists:tipo_curso,id_tipo_curso',

        ];
    }

    public function messages(): array
    {
        return [
            'nome_curso.required' => 'O nome do cargo é obrigatório.',
            'id_nivel_curso.required' => 'O nível é obrigatório.',
            'id_tipo_curso.exists' => 'Tipo de Curso selecionado é inválido.',
            'id_tipo_curso.required' => 'O tipo de Curso é obrigatório.',

        ];
    }
}
