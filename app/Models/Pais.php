<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \OwenIt\Auditing\Auditable as AuditingAuditable;
use OwenIt\Auditing\Contracts\Auditable;

class Pais extends Model implements Auditable
{
    use HasFactory, AuditingAuditable;

    protected $table = 'paises';

    protected $fillable = ['nome', 'codigo', 'continente_id'];

      // Criar relacionamento entre um e muitos
      public function continente(){

        return $this->belongsTo(Continente::class);
    }

     // Criar relacionamento entre um e muitos( Pais e provincia)
     public function provincia(){

        return $this->hasMany(Provincia::class);
     }

}
