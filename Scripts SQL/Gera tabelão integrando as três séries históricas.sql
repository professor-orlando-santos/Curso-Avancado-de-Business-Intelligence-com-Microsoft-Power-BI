/*
select min(ano), max(ano)
from public.estados_populacao;


select min(ano), max(ano)
from public.estados_servidores_publicos;


select min(ano), max(ano)
from public.inscricoes_evg;
*/

--integrar a sigla_uf da pessoa nas inscrições com os dados dos estados
Select distinct pessoa_uf_sigla
from inscricoes_evg;

--Inserir a UF "Não informada nos estados e Regiões
/*
select * from regioes  order by regiao_codigo_ibge;

insert into regioes(regiao_codigo_ibge, regiao_sigla, regiao_nome)
values (-1, 'NI', 'Não informada');


select * from regioes order by regiao_codigo_ibge;



select * from estados, order by uf_codigo_ibge;

insert into estados(uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values (-1, 'NI', 'Não informada', -1);

select * from estados order by uf_codigo_ibge;

*/

with base as (
			select uf_codigo_ibge, ano
			from estados e
			cross join generate_series(2012,2019) as ano
			 ),
	populacao as (
			select uf_codigo_ibge, ano, populacao_estimada
			from estados_populacao
			),
	servidores as 
			(
			select uf_codigo_ibge, ano
			, sum(quantidade_de_vinculos) as quantidade_de_vinculos
			from estados_servidores_publicos
			group by uf_codigo_ibge, ano
			),
	inscricoes as 
			(
			select uf_codigo_ibge, ano
			, sum(inscricoes) as quantidade_de_inscricoes
			from inscricoes_evg i
			join estados e 
				on e.uf_sigla = i.pessoa_uf_sigla
			group by uf_codigo_ibge, ano
			)			
select 
base.uf_codigo_ibge as "UF Código IBGE"
, base.ano as "Ano"
, pop.populacao_estimada as "População Residente Estimada"
, serv.quantidade_de_vinculos as "Qtd. de Vínculos"
, insc.quantidade_de_inscricoes as "Qtd. de Inscrições"
from base
left join populacao pop 
	on base.uf_codigo_ibge = pop.uf_codigo_ibge
	and base.ano = pop.ano
left join servidores serv
	on base.uf_codigo_ibge = serv.uf_codigo_ibge
	and base.ano = serv.ano
left join inscricoes insc
	on base.uf_codigo_ibge = insc.uf_codigo_ibge
	and base.ano = insc.ano;
	
	
--Gerar um tabela com os dados dos estados

select 
e.uf_codigo_ibge as "UF Código IBGE"
, e.uf_sigla as "UF"
, e.uf_nome as "Estado"
, e.regiao_codigo_ibge as "Região Código IBGE"
, ed.capital as "Capital"
, ed.area_territorial as "Área Territorial (Km²)"
, case when ea.uf_codigo_ibge is not null then 'Bioma Amazônia' else 'Outros Biomas' end as "Bioma"
from estados e
left join estados_dados_complementares ed
	on e.uf_codigo_ibge = ed.uf_codigo_ibge
left join estados_bioma_amazonia ea
	on e.uf_codigo_ibge = ea.uf_codigo_ibge;


--gerar tabela de regiões
select 
regiao_codigo_ibge as "Região Código IBGE"
, regiao_sigla as "Região Sigla"
, regiao_nome as "Região"
from regioes;
