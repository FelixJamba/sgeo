<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\DB;

class AddPessoaEstruturaRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules()
    {
        return [
            'id_pessoa_juridica' => 'required|exists:pessoa_juridica,id_pessoa_juridica',
            'pesquisar_nip' => 'sometimes|string' // Campo de pesquisa opcional
        ];
    }

    public function messages()
    {
        return [
            'id_pessoa_juridica.required' => 'O campo Militar é obrigatório.',
            'id_pessoa_juridica.exists' => 'O Militar selecionado não existe.',
        ];
    }

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $militarId = $this->id_pessoa_juridica;
            $estruturaId = $this->route('id');

            // Buscar informações da estrutura
            $estrutura = DB::table('estrutura_organica')
                ->select(
                    'estrutura_organica.id_estrutura_organica',
                    DB::raw('COALESCE((SELECT COUNT(*) FROM tbl_cargo_pessoa WHERE id_estrutura_organica = estrutura_organica.id_estrutura_organica), 0) AS contar_cargos'),
                    'estrutura_organica.quantidade_organica AS qtd_org',
                    'estrutura_organica.id_posto_organico AS posto_exigido'
                )
                ->where('estrutura_organica.id_estrutura_organica', $estruturaId)
                ->first();

            if (!$estrutura) {
                $validator->errors()->add('estrutura', 'Estrutura não encontrada.');
                return;
            }

            // Verificar se militar já está alocado em algum cargo
            $militarEmCargo = DB::table('tbl_cargo_pessoa')
                ->where('id_pessoa', $militarId)
                ->exists();

            if ($militarEmCargo) {
                $validator->errors()->add('militar', 'Este militar já ocupa um cargo.');
            }

            // Verificar vagas disponíveis
            if ($estrutura->contar_cargos >= $estrutura->qtd_org) {
                $validator->errors()->add('vagas', 'Não há vagas disponíveis neste cargo.');
            }

            // Verificar compatibilidade de postos
            $militar = DB::table('pessoa_juridica')
                ->where('id_pessoa_juridica', $militarId)
                ->select('id_patente')
                ->first();

            if (!$militar) {
                $validator->errors()->add('militar', 'Militar não encontrado.');
                return;
            }

            if ($militar->id_patente < $estrutura->posto_exigido) {
                $validator->errors()->add('posto', 'Posto do militar é inferior ao exigido pelo cargo (artigo 19º da Lei 13/18).');
            }
        });
    }
}
