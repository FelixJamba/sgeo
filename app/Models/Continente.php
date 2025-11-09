<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use \OwenIt\Auditing\Auditable as AuditingAuditable;
use OwenIt\Auditing\Contracts\Auditable;

class Continente extends Model implements Auditable
{
    use HasFactory, AuditingAuditable;

    // Indicar o nome da tabela
    protected $table = 'continentes';

    // Indicar quais colunas podem ser cadastrada
    protected $fillable = ['nome'];

    // Criar relacionamento entre um e muitos
    public function pais(){
        
        return $this->hasMany(Pais::class);
    }

}
