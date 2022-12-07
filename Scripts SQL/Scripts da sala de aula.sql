select * 
from estados
where regiao_codigo_ibge in (
		select regiao_codigo_ibge
		from regioes
		where regiao_sigla in ('N', 'NE')
	)
union
select * 
from estados
where regiao_codigo_ibge in (
		select regiao_codigo_ibge
		from regioes
		where regiao_sigla not in ('N', 'NE')
	)


select * from estados

select * from estados_bioma_amazonia

select *
from estados , estados_bioma_amazonia
where estados.uf_codigo_ibge = estados_bioma_amazonia.uf_codigo_ibge

select * from estados where lower(uf_nome) not like '%ão%'


select *
from estados
where regiao_codigo_ibge in (
		select regiao_codigo_ibge
		from regioes
		where regiao_sigla  in ('N', 'NE')
	)
and ( uf_nome like '%o' or uf_nome like '%a')


