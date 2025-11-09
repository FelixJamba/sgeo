<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \OwenIt\Auditing\Auditable as AuditingAuditable;
use OwenIt\Auditing\Contracts\Auditable;

class Provincia extends Model implements Auditable
{
    use HasFactory, AuditingAuditable;

    protected $table = 'provincias';

    protected $fillable = ['nome', 'pais_id'];

    // Criar relacionamento entre um e muitos (Uma Provincia tem Muitos Municipios)
    public function municipio(){

        return $this->hasMany(Municipio::class);
    }

     // Criar relacionamento entre um e muitos (Provincia e Pais)
     public function pais(){

        return $this->belongsTo(Pais::class);
     }

}

