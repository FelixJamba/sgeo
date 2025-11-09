<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class SpecialistRequest extends FormRequest
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
     */
    public function rules(): array
    {
        return [
            // Dados Pessoais
            'nome' => ['required', 'string', 'max:255'],
            'alcunha' => ['nullable', 'string', 'max:100'],
            'data_nascimento' => ['required', 'date', 'before:today'],
            'id_sexo' => ['nullable', 'exists:sexo,id_sexo'],
            'id_estado_civil' => ['nullable', 'exists:estado_civil,id_estado_civil'],
            'id_provincia_nascimento' => ['nullable', 'exists:provincia,idprovincia'],
            'nome_pai' => ['nullable', 'string', 'max:255'],
            'nome_mae' => ['nullable', 'string', 'max:255'],
            'id_bairro' => ['nullable', 'exists:bairro,idbairro'],
            'endereco' => ['nullable', 'string', 'max:255'],
            'grupo_sanguineo' => ['nullable', 'exists:tbl_gsanguineo,idGSangue'],
            'altura' => ['nullable', 'numeric', 'min:0', 'max:3'],
            'Nro_Calcado' => ['nullable', 'string', 'max:4'],
            'Nro_Camisa' => ['nullable', 'string', 'max:4'],
            'Nro_Calca' => ['nullable', 'string', 'max:4'],
            'habilitacao_id' => ['nullable', 'exists:habilitacaoLiteraria,habilitacao_id'],

            // Dados Militares
            'nip' => [
                'required',
                'string',
                'max:9',
                Rule::unique('pessoa_juridica', 'nip')
                    ->ignore($this->route('id'), 'id_pessoa_juridica'),
            ],


            'id_posto_organico' => ['required', 'exists:dcm_postosmilitares,Posto_Id'],
            'incorporacao' => ['nullable', 'exists:tipo_Incorporacao,id_tipo'],
            'data_incorporacao' => ['nullable', 'date', 'before_or_equal:today'],
            'idlocal_incorporacao' => ['nullable', 'exists:provincia,idprovincia'],
            'quadro_especial' => ['nullable', 'exists:dcm_classes,Classe_Id'],
            'especialidade' => ['nullable', 'exists:especialidade,id_especialidade'],
            'FPS' => ['nullable'],
            'id_situacao' => ['nullable', 'exists:situacao_servico,id_situacao'],
            'id_condicao' => ['nullable', 'exists:situacao_condicoes,id'],

            // Histórico de Postos
            'posto.*' => ['nullable', 'exists:dcm_postosmilitares,Posto_Id'],
            'cargo.*' => ['nullable', 'exists:cargo,id_cargo'],
            'ordem.*' => ['nullable', 'exists:tbl_ordens,id'],

            // Formação
            'formacao_instituicao.*' => ['nullable', 'exists:instituicao,id_instituicao'],
            'id_curso.*' => ['nullable', 'exists:curso,id_curso'],
            'formacao_inicio.*' => ['nullable', 'date', 'before_or_equal:today'],
            'formacao_fim.*' => ['nullable', 'date', 'after_or_equal:formacao_inicio.*'],
            'nota.*' => ['nullable', 'numeric', 'min:0', 'max:20'],

            // Documentos
            'documentos.*.id_tipo_doc' => ['nullable', 'exists:tipo_documento,id_tipo_doc'],
            'documentos.*.numero_doc' => ['nullable', 'string', 'max:50'],
            'documentos.*.data_emissao' => ['nullable', 'date', 'before_or_equal:today'],
            'documentos.*.data_validade' => ['nullable', 'date', 'after_or_equal:documento.*.data_emissao'],

            // Contactos
            'contactos.*.tipo_contacto' => ['nullable', 'exists:tbl_tipo_contacto,idTipoContactos'],
            'contactos.*.contacto' => ['nullable', 'string', 'max:100'],

            // Foto
            'foto_militar' => ['nullable', 'image', 'mimes:jpeg,png', 'max:2048'],

            // Agregado Familiar
            'agregado.*.Nome_Agr' => ['nullable', 'string', 'max:255'],
            'agregado.*.Data_Nasc_Agr' => ['nullable', 'date', 'before:today'],
            'agregado.*.idGrauParentesco' => ['nullable', 'exists:tbl_grauparentesco,idGParentesco'],
            'agregado.*.Sexo_Agr' => ['nullable', 'in:M,F'],
            'agregado.*.Provincia_Agr' => ['nullable', 'exists:provincia,idprovincia'],
        ];
    }

    /**
     * Get custom error messages for validation.
     */
    public function messages(): array
    {
        return [
            // Dados Pessoais
            'nome.max' => 'O nome não pode ter mais de 255 caracteres.',
            'nome.required' => 'O nome é obrigatório.',
            'alcunha.max' => 'A alcunha não pode ter mais de 100 caracteres.',
            'data_nascimento.before' => 'A data de nascimento deve ser anterior a hoje.',
            'id_sexo.exists' => 'O sexo selecionado é inválido.',
            'id_estado_civil.exists' => 'O estado civil selecionado é inválido.',
            'id_provincia_nascimento.exists' => 'A província de nascimento selecionada é inválida.',
            'id_bairro.exists' => 'O bairro selecionado é inválido.',
            'endereco.max' => 'O endereço não pode ter mais de 255 caracteres.',
            'grupo_sanguineo.exists' => 'O grupo sanguíneo selecionado é inválido.',
            'altura.numeric' => 'A altura deve ser um número.',
            'altura.min' => 'A altura não pode ser negativa.',
            'altura.max' => 'A altura não pode ser superior a 3 metros.',
            'Nro_Calcado.max' => 'O número do calçado não pode ter mais de 4 caracteres.',
            'Nro_Camisa.max' => 'O número da camisa não pode ter mais de 4 caracteres.',
            'Nro_Calca.max' => 'O número da calça não pode ter mais de 4 caracteres.',
            'habilitacao_id.exists' => 'A habilitação literária selecionada é inválida.',

            // Dados Militares
            'nip.max' => 'O NIP não pode ter mais de 9 caracteres.',
            'nip.unique' => 'O NIP já está registrado.',
            'nip.required' => 'O NIP é obrigatório.',
            'id_posto_organico.exists' => 'O posto selecionado é inválido.',
            'id_posto_organico.required' => 'O posto é obrigatório.',
            'incorporacao.exists' => 'O tipo de incorporação selecionado é inválido.',
            'data_incorporacao.before_or_equal' => 'A data de incorporação deve ser hoje ou anterior.',
            'data_incorporacao.required' => 'A data de incorporação é obrigatória.',
            'idlocal_incorporacao.exists' => 'O local de incorporação selecionado é inválido.',
            'quadro_especial.exists' => 'O quadro especial selecionado é inválido.',
            'especialidade.exists' => 'A especialidade selecionada é inválida.',
            'id_situacao.exists' => 'A situação de serviço selecionada é inválida.',
            'id_condicao.exists' => 'A condição militar selecionada é inválida.',
            'id_estado.exists' => 'O estado selecionado é inválido.',

            // Histórico de Postos
            'posto.*.exists' => 'O posto selecionado no histórico é inválido.',
            'cargo.*.exists' => 'O cargo selecionado no histórico é inválido.',
            'ordem.*.exists' => 'A ordem selecionada no histórico é inválida.',


            // Formação
            'formacao_instituicao.*.exists' => 'A instituição selecionada é inválida.',
            'id_curso.*.exists' => 'O curso selecionado é inválido.',
            'formacao_inicio.*.before_or_equal' => 'A data de início da formação deve ser hoje ou anterior.',
            'formacao_fim.*.after_or_equal' => 'A data de fim deve ser igual ou posterior à data de início.',
            'nota.*.numeric' => 'A nota deve ser um número.',
            'nota.*.min' => 'A nota não pode ser inferior a 0.',
            'nota.*.max' => 'A nota não pode ser superior a 20.',

            // Documentos
            'documentos.*.id_tipo_doc.exists' => 'O tipo de documento selecionado é inválido.',
            'documentos.*.numero_doc.max' => 'O número do documento não pode ter mais de 50 caracteres.',
            'documentos.*.data_emissao.before_or_equal' => 'A data de emissão deve ser hoje ou anterior.',
            'documentos.*.data_validade.after_or_equal' => 'A data de validade deve ser igual ou posterior à data de emissão.',

            // Contactos
            'contactos.*.tipo_contacto.exists' => 'O tipo de contacto selecionado é inválido.',
            'contactos.*.contacto.max' => 'O contacto não pode ter mais de 100 caracteres.',

            // Foto
            'foto_militar.image' => 'O arquivo deve ser uma imagem.',
            'foto_militar.mimes' => 'A foto deve ser no formato JPG ou PNG.',
            'foto_militar.max' => 'A foto não pode ter mais de 2MB.',

            // Agregado Familiar
            'agregado.*.Nome_Agr.max' => 'O nome do membro do agregado familiar não pode ter mais de 255 caracteres.',
            'agregado.*.Data_Nasc_Agr.before' => 'A data de nascimento do membro deve ser anterior a hoje.',
            'agregado.*.idGrauParentesco.exists' => 'O grau de parentesco selecionado é inválido.',
            'agregado.*.Sexo_Agr.in' => 'O sexo do membro deve ser Masculino (M) ou Feminino (F).',
            'agregado.*.Provincia_Agr.exists' => 'A província do membro selecionada é inválida.',
        ];
    }
}
