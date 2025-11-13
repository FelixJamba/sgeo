<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Closure;
use Symfony\Component\HttpFoundation\Response;


class AuditoriaMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
       // Deixa a requisição seguir
        $response = $next($request);

        // Auditoria só em métodos de escrita
        if (in_array($request->method(), ['POST', 'PUT', 'PATCH', 'DELETE'])) {

            try {
                DB::table('log_auditoria')->insert([
                    'tabela' => $this->detectarTabela($request),
                    'acao' => strtolower($request->method()),
                    'registro_id' => $request->id ?? null,
                    'dados_anteriores' => $request->method() !== 'POST'
                        ? json_encode($this->buscarAntes($request), JSON_UNESCAPED_UNICODE)
                        : null,
                    'dados_novos' => json_encode($request->except(['_token', '_method']), JSON_UNESCAPED_UNICODE),
                    'usuario_id' => Auth::id(),
                    'ip' =>  $request->ip ?? null,
                    
                ]);
            } catch (\Exception $e) {
                Log::error('Erro na auditoria automática', ['erro' => $e->getMessage()]);
            }
        }

        return $response;
    }

    private function detectarTabela($request)
    {
        // tenta deduzir o nome da tabela pelo caminho da rota
        $rota = $request->route()?->getName();
        if ($rota) {
            return str_replace(['store.', 'update.', 'destroy.', 'structure.'], '', $rota);
        }
        return 'desconhecida';
    }

    private function buscarAntes($request)
    {
        // tenta obter dados antigos (se houver ID e tabela)
        $tabela = $this->detectarTabela($request);
        $id = $request->id ?? null;
        if ($id && $tabela !== 'desconhecida') {
            try {
                return DB::table($tabela)->find($id);
            } catch (\Exception $e) {
                return null;
            }
        }
        return null;
    }
    
}
