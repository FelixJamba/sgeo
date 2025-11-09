@extends('layouts.admin')

@section('content')
    <div class="container-fluid px-4">
        <div class="mb-1 hstack gap-2">
            <h2 class="mt-3"><i class="fas fa-users me-2"></i>Especialistas</h2>

            <ol class="breadcrumb mb-3 mt-3 ms-auto">
                <li class="breadcrumb-item">
                    <a href="{{ route('dashboard.index') }}" class="text-decoration-none bg">
                        <i class="fas fa-home me-1"></i> Dashboard
                    </a>
                </li>
                <li class="breadcrumb-item active">
                    <i class="fas fa-user-shield me-1"></i> Especialistas
                </li>
            </ol>
        </div>

        <hr class="mt-2 mb-3">

        <div class="card mb-4 border-0 shadow-sm">
            <div class="card-header bg-nav text-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0"><i class="fas fa-list me-2"></i> Lista de Especialistas</h5>
                    @can('create-specialist')
                        <a href="{{ route('specialist.create') }}" class="btn btn-light btn-sm">
                            <i class="fas fa-plus-circle me-1"></i> Cadastrar
                        </a>
                    @endcan
                </div>
            </div>
<div class="card-body">
    <x-alert />
    <div class="table-responsive">
        <table class="table table-hover align-middle" id="table-especialista">
            <thead class="table-light">
                <tr>
                    <th>Foto</th>
                    <th>Posto</th>
                    <th>NIP</th>
                    <th>Nome</th>                    
                    <th class="d-none d-md-table-cell">Cargo</th>
                    <th class="d-none d-lg-table-cell">UEO</th>
                    <th>Situação</th>
                    <th class="text-center" width="120">Acções</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($specialists as $specialist)
                    <tr class="hover-shadow">
                        <td>
                            @if ($specialist->foto_militar)
                                <img src="{{ asset('storage/' . $specialist->foto_militar) }}"
                                    alt="Foto de {{ $specialist->nome }}" class="img-thumbnail"
                                    style="width: 50px; height: 50px; object-fit: cover;">
                            @else
                                <img src="{{ asset('images/default-user.png') }}"
                                    alt="Foto padrão" class="img-thumbnail"
                                    style="width: 50px; height: 50px; object-fit: cover;">
                            @endif
                        </td>
                        <td>
                            <span class="badge bg-success">{{ $specialist->posto }}</span>
                        </td>
                        <td>{{ $specialist->nip }}</td>
                        <td>{{ $specialist->nome }}</td>                        
                        <td class="d-none d-md-table-cell">{{ $specialist->cargo }}</td>
                        <td class="d-none d-lg-table-cell">{{ $specialist->unidade_colocado }}</td>
                        <td>{{ $specialist->situacao }}</td>
                        <td class="text-center">
                            <div class="btn-group btn-group-sm" role="group">
                                
                                <a href="{{ route('specialist.show', ['id' => $specialist->id_pessoa_fisica]) }}"
                                    class="btn btn-outline-primary" data-bs-toggle="tooltip" title="Visualizar">
                                    <i class="fas fa-eye"></i>
                                </a>

                                @can('edit-specialist')
                                    <a href="{{ route('specialist.edit', ['id' => $specialist->id_pessoa_fisica]) }}"
                                        class="btn btn-outline-warning" data-bs-toggle="tooltip" title="Editar">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                @endcan

                                @can('delete-specialist')
                                    <form action="{{ route('specialist.destroy', $specialist->id_pessoa_fisica) }}"
                                        method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-outline-danger btn-delete"
                                            data-bs-toggle="tooltip" title="Excluir"
                                            onclick="">
                                            <i class="fas fa-trash-alt"></i>
                                        </button> 
                                    </form>
                                @endcan
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

        </div>
    </div>
@endsection
