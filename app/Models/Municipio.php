<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \OwenIt\Auditing\Auditable as AuditingAuditable;
use OwenIt\Auditing\Contracts\Auditable;

class Municipio extends Model implements Auditable
{
    use HasFactory, AuditingAuditable;

    protected $table = 'municipios';

    protected $fillable = ['nome', 'provincia_id'];

    // Criar relacionamento entre um e muitos (Muitos Municipios pertencem a Uma Provincia)
    public function provincia(){

        return $this->belongsTo(Provincia::class);
    }


}
