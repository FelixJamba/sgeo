<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Str;

class UserController extends Controller
{
    // Listar os usuários
    public function index(Request $request)
    {
        // Salvar log
        Log::info('Listar usuários.', ['action_user_id' => Auth::id()]);

        // Recuperar os registros do banco dados
        // $users = User::orderByDesc('created_at')->paginate(10);
        $users = User::when($request->has('name'), function ($whenQuery) use ($request) {
            $whenQuery->where('name', 'like', '%' . $request->name . '%');
        })
            ->when($request->has('email'), function ($whenQuery) use ($request) {
                $whenQuery->where('email', 'like', '%' . $request->email . '%');
            })
            ->when($request->filled('start_date_registration'), function ($whenQuery) use ($request) {
                $whenQuery->where('created_at', '>=', \Carbon\Carbon::parse($request->start_date_registration)->format('Y-m-d H:i:s'));
            })
            ->when($request->filled('end_date_registration'), function ($whenQuery) use ($request) {
                $whenQuery->where('created_at', '<=', \Carbon\Carbon::parse($request->end_date_registration)->format('Y-m-d H:i:s'));
            })
            ->orderByDesc('created_at')
            ->paginate(10)
            ->withQueryString();

        // Carregar a VIEW
        return view('users.index', [
            'menu' => 'users',
            'users' => $users,
            'name' => $request->name,
            'email' => $request->email,
            'start_date_registration' => $request->start_date_registration,
            'end_date_registration' => $request->end_date_registration,
        ]);
    }

    // Detalhes do usuario
    public function show(User $user)
    {
        // Verifica se é o próprio user ou se é admin
        if (auth()->id() !== $user->id && !auth()->user()->hasRole('Super Admin')) {
            return back()->with('error', 'Não tens permissão para visualizar este usuário.');
        }
        // Salvar log
        Log::info('Visualizar usuário.', ['id' => $user->id, 'action_user_id' => Auth::id()]);

        // Carregar a VIEW
        return view('users.show', ['menu' => 'users', 'user' => $user]);
    }

    // Carregar o formulário cadastrar novo usuário
    public function create()
    {
        // Salvar log
        Log::info('Carregar formulário cadastrar usuário.', ['action_user_id' => Auth::id()]);

        // Recuperar os papéis
        $roles = Role::pluck('name')->all();

        // Carregar a VIEW
        return view('users.create', ['menu' => 'users', 'roles' => $roles]);
    }

    // Cadastrar no banco de dados o novo curso
    public function store(UserRequest $request)
    {
        // Validar o formulário
        $request->validated();

        // Marca o ponto inicial de uma transação
        DB::beginTransaction();

        try {
            // Cadastrar no banco de dados na tabela usuários
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => $request->password,
            ]);

            // Cadastrar papel para o usuário
            $user->assignRole($request->roles);

            // Salvar log
            Log::info('Usuário cadastrado.', ['id' => $user->id, 'action_user_id' => Auth::id()]);

            // Operação é concluída com êxito
            DB::commit();

            // Redirecionar o usuário, enviar a mensagem de sucesso
            return redirect()
                ->route('user.show', ['user' => $user->id])
                ->with('success', 'Usuário cadastrado com sucesso!');
        } catch (Exception $e) {
            // Salvar log
            Log::info('Usuário não cadastrado.', ['error' => $e->getMessage(), 'action_user_id' => Auth::id()]);

            // Operação não é concluída com êxito
            DB::rollBack();

            // Redirecionar o usuário, enviar a mensagem de erro
            return back()->withInput()->with('error', 'Usuário não cadastrado!');
        }
    }

    // Carregar o formulário editar usuário
    public function edit(User $user)
    {
        // Verifica se é o próprio user ou se é admin
        if (auth()->id() !== $user->id && !auth()->user()->hasRole('Super Admin')) {
            return back()->with('error', 'Não tens permissão para editar este usuário.');
        }

        // Se for Super Admin, mostra todos os papéis
        if (auth()->user()->hasRole('Super Admin')) {
            $roles = Role::pluck('name')->all();
        } else {
            // Se for o próprio user, não carrega papéis
            $roles = [];
        }

        // Recuperar o papel do usuário (vai ser só para exibição, não edição)
        $userRoles = $user->roles->pluck('name')->first();

        // Salvar log
        Log::info('Carregar formulário editar usuário.', ['id' => $user->id, 'action_user_id' => Auth::id()]);

        // Carregar a VIEW
        return view('users.edit', [
            'menu' => 'users',
            'user' => $user,
            'roles' => $roles,
            'userRoles' => $userRoles,
        ]);
    }

    // Editar no banco de dados o usuário
    public function update(UserRequest $request, User $user)
    {
        // Validar o formulário
        $request->validated();

        // Marca o ponto inicial de uma transação
        DB::beginTransaction();

        try {
            // Editar as informações do registro no banco de dados
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
            ]);

            // Editar papel para o usuário
            // Só editar o papel se o campo veio no request
            if ($request->filled('roles')) {
                $user->syncRoles([$request->roles]);
            }

            // Salvar log
            Log::info('Usuário editado.', ['id' => $user->id, 'action_user_id' => Auth::id()]);

            // Operação é concluída com êxito
            DB::commit();

            // Redirecionar o usuário, enviar a mensagem de sucesso
            return redirect()
                ->route('user.show', ['user' => $request->user])
                ->with('success', 'Usuário editado com sucesso!');
        } catch (Exception $e) {
            // Salvar log
            Log::info('Usuário não editado.', ['error' => $e->getMessage(), 'action_user_id' => Auth::id()]);

            // Operação não é concluída com êxito
            DB::rollBack();

            // Redirecionar o usuário, enviar a mensagem de erro
            return back()->withInput()->with('error', 'Usuário não editado!');
        }
    }

    // Carregar o formulário editar senha do usuário
    public function editPassword(User $user)
    {
        // Carregar a VIEW
        return view('users.editPassword', ['menu' => 'users', 'user' => $user]);
    }

    // Editar no banco de dados a senha do usuário
    public function updatePassword(Request $request, User $user)
    {
        // Verifica se é o próprio user ou se é admin
        if (auth()->id() !== $user->id && !auth()->user()->hasRole('Super Admin')) {
            return back()->with('error', 'Não tens permissão para alterar esta senha.');
        }

        // Validação
        $request->validate(
            [
                'password' => 'required|min:6|confirmed',
            ],
            [
                'password.required' => 'O campo senha é obrigatório.',
                'password.min' => 'A senha deve ter pelo menos :min caracteres.',
                'password.confirmed' => 'A confirmação da senha não coincide.',
            ],
        );

        DB::beginTransaction();

        try {
            $user->update([
                'password' => \Hash::make($request->password),
            ]);

            Log::info('Senha do usuário editada.', [
                'id' => $user->id,
                'action_user_id' => auth()->id(),
            ]);

            DB::commit();

            return back()->with('success', 'Senha do usuário editada com sucesso!');
        } catch (\Exception $e) {
            Log::error('Erro ao editar senha.', [
                'error' => $e->getMessage(),
                'action_user_id' => auth()->id(),
            ]);

            DB::rollBack();

            return back()->withInput()->with('error', 'Senha do usuário não editada!');
        }
    }

    // Excluir o usuário do banco de dados
    public function destroy(User $user)
    {
        try {
            // Excluir o registro do banco de dados
            $user->delete();

            // Remove todos os papéis atribuídos ao usuário
            $user->syncRoles([]);

            // Salvar log
            Log::info('Usuário excluído.', ['id' => $user->id, 'action_user_id' => Auth::id()]);

            // Redirecionar o usuário, enviar a mensagem de sucesso
            return redirect()->route('user.index')->with('success', 'Usuário excluído com sucesso!');
        } catch (Exception $e) {
            // Salvar log
            Log::info('Usuário não excluído.', ['error' => $e->getMessage(), 'action_user_id' => Auth::id()]);

            // Redirecionar o usuário, enviar a mensagem de erro
            return redirect()->route('course.index')->with('error', 'Usuário não excluído!');
        }
    }

}
