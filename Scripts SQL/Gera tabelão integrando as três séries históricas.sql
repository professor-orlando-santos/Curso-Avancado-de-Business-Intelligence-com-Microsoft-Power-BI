/*
select min(ano), max(ano)
from public.estados_populacao;


select min(ano), max(ano)
from public.estados_servidores_publicos;


select min(ano), max(ano)
from public.inscricoes_evg;
*/

with populacao 
	as (select * from estados_populacao),
	servidores 
	as (select uf_codigo_ibge, ano
		, sum(quantidade_de_vinculos) as quantidade_de_vinculos
	   from estados_servidores_publicos
	   group by uf_codigo_ibge, ano )
select * 
from populacao p 
left join servidores s
	on s.uf_codigo_ibge = p.uf_codigo_ibge
	and s.ano = p.ano