CREATE SCHEMA IF NOT EXISTS evg;

--cria a tabela dimensional temática

CREATE TABLE IF NOT EXISTS evg.dm_tematica
(
    tematica_id integer NOT NULL,
    tematica character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tematica_pkey PRIMARY KEY (tematica_id)
);


select * from evg.dm_tematica order by tematica_id;

insert into evg.dm_tematica(tematica_id, tematica)
select distinct origem.tematica_id, origem.tematica
from public.inscricoes_evg origem
left join  evg.dm_tematica destino 
	on destino.tematica_id = origem.tematica_id
where destino.tematica_id is null
order by tematica_id;

update evg.dm_tematica destino
set tematica = origem.tematica
from (
		select distinct tematica_id, tematica
		from public.inscricoes_evg
	) as origem
where origem.tematica_id = destino.tematica_id;


insert into evg.dm_tematica(tematica_id, tematica)
select distinct tematica_id, tematica
from public.inscricoes_evg
order by tematica_id
on conflict(tematica_id) DO
    update set tematica = EXCLUDED.tematica;

select * from evg.dm_tematica order by tematica_id;

update evg.dm_tematica set tematica = upper(tematica)
where tematica_id <= 5;

select * from evg.dm_tematica order by tematica_id;


--cria a tabela dimensional curso

CREATE TABLE IF NOT EXISTS evg.dm_curso
(
    cod_curso integer NOT NULL,
    nome_curso character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT nome_curso_pkey PRIMARY KEY (cod_curso)
);


select * from evg.dm_curso order by cod_curso;


insert into evg.dm_curso(cod_curso, nome_curso)
select distinct cod_curso, nome_curso
from public.inscricoes_evg
order by cod_curso
on conflict(cod_curso) DO
    update set nome_curso = EXCLUDED.nome_curso;

select * from evg.dm_curso order by cod_curso;

--cria a tabela dimensional esfera

CREATE TABLE IF NOT EXISTS evg.dm_esfera
(
    esfera_id integer NOT NULL,
    esfera character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT esfera_pkey PRIMARY KEY (esfera_id)
);


select * from evg.dm_esfera order by esfera_id;


insert into evg.dm_esfera(esfera_id, esfera)
select distinct esfera_id, esfera
from public.inscricoes_evg
order by esfera_id
on conflict(esfera_id) DO
    update set esfera = EXCLUDED.esfera;


select * from evg.dm_esfera order by esfera_id;


--cria a tabela dimensional poder

CREATE TABLE IF NOT EXISTS evg.dm_poder
(
    poder_id integer NOT NULL,
    poder character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT poder_pkey PRIMARY KEY (poder_id)
);


select * from evg.dm_poder order by poder_id;


insert into evg.dm_poder(poder_id, poder)
select distinct poder_id, poder
from public.inscricoes_evg
order by poder_id
on conflict(poder_id) DO
    update set poder = EXCLUDED.poder;


select * from evg.dm_poder order by poder_id;


--cria a tabela dimensional sexo

CREATE TABLE IF NOT EXISTS evg.dm_sexo
(
    sexo_id integer NOT NULL,
    sexo character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT sexo_pkey PRIMARY KEY (sexo_id)
);


select * from evg.dm_sexo order by sexo_id;


insert into evg.dm_sexo(sexo_id, sexo)
select distinct sexo_id, sexo
from public.inscricoes_evg
order by sexo_id
on conflict(sexo_id) DO
    update set sexo = EXCLUDED.sexo;


select * from evg.dm_sexo order by sexo_id;


--cria a tabela dimensional situacao_matricula

CREATE TABLE IF NOT EXISTS evg.dm_situacao_matricula
(
    situacao_matricula_id integer NOT NULL,
    situacao_matricula character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT situacao_matricula_pkey PRIMARY KEY (situacao_matricula_id)
);


select * from evg.dm_situacao_matricula order by situacao_matricula_id;


insert into evg.dm_situacao_matricula(situacao_matricula_id, situacao_matricula)
select distinct situacao_matricula_id, situacao_matricula
from public.inscricoes_evg
order by situacao_matricula_id
on conflict(situacao_matricula_id) DO
    update set situacao_matricula = EXCLUDED.situacao_matricula;


select * from evg.dm_situacao_matricula order by situacao_matricula_id;


--cria a tabela dimensional situacao_turma

CREATE TABLE IF NOT EXISTS evg.dm_situacao_turma
(
    situacao_turma_id integer NOT NULL,
    situacao_turma character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT situacao_turma_pkey PRIMARY KEY (situacao_turma_id)
);


select * from evg.dm_situacao_turma order by situacao_turma_id;


insert into evg.dm_situacao_turma(situacao_turma_id, situacao_turma)
select distinct situacao_turma_id, situacao_turma
from public.inscricoes_evg
order by situacao_turma_id
on conflict(situacao_turma_id) DO
    update set situacao_turma = EXCLUDED.situacao_turma;


select * from evg.dm_situacao_turma order by situacao_turma_id;


--cria a tabela dimensional faixa_idade

CREATE TABLE IF NOT EXISTS evg.dm_faixa_idade
(
    faixa_idade_id integer NOT NULL,
    faixa_idade character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT faixa_idade_pkey PRIMARY KEY (faixa_idade_id)
);


select * from evg.dm_faixa_idade order by faixa_idade_id;


insert into evg.dm_faixa_idade(faixa_idade_id, faixa_idade)
select distinct faixa_idade_id, faixa_idade
from public.inscricoes_evg
order by faixa_idade_id
on conflict(faixa_idade_id) DO
    update set faixa_idade = EXCLUDED.faixa_idade;


select * from evg.dm_faixa_idade order by faixa_idade_id;


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


CREATE TABLE IF NOT EXISTS evg.ft_inscricoes
(
    id serial not null,
    ano integer NOT NULL,
    tematica_id integer NOT NULL,
    cod_curso integer NOT NULL,
	uf_codigo_ibge integer NOT NULL,
    esfera_id integer NOT NULL,
	poder_id integer NOT NULL,
	sexo_id integer NOT NULL,
	situacao_matricula_id integer NOT NULL,
	situacao_turma_id integer NOT NULL,
	faixa_idade_id integer NOT NULL,
	quantidade_de_inscricoes integer NOT NULL,
    CONSTRAINT inscricoes_evg_pkey PRIMARY KEY (id)
);

select * from evg.ft_inscricoes limit 100; 

truncate table  evg.ft_inscricoes;

insert into evg.ft_inscricoes (ano, tematica_id, cod_curso, uf_codigo_ibge,
	esfera_id, poder_id, sexo_id, situacao_matricula_id, situacao_turma_id, 
	faixa_idade_id ,quantidade_de_inscricoes)
select i.ano, i.tematica_id, i.cod_curso, e.uf_codigo_ibge,
	i.esfera_id, i.poder_id, i.sexo_id, i.situacao_matricula_id, i.situacao_turma_id, 
	i.faixa_idade_id ,sum(i.inscricoes) as quantidade_de_inscricoes
from public.inscricoes_evg i
join estados e on e.uf_sigla = i.pessoa_uf_sigla
group by i.ano, i.tematica_id, i.cod_curso, e.uf_codigo_ibge,
	i.esfera_id, i.poder_id, i.sexo_id, i.situacao_matricula_id, i.situacao_turma_id, 
	i.faixa_idade_id 
order by ano;
	
select * from evg.ft_inscricoes limit 100; 





