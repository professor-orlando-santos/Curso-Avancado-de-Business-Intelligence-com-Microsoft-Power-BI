/*Crição do banco de dados   */

--CREATE DATABASE bd_estados_brasil;

/*Após a criação do banco alterar a conexão para o novo banco criado antes de prosseguir
com a execução dos demais scripts*/

DROP TABLE IF EXISTS regioes CASCADE;

CREATE table regioes (
regiao_codigo_ibge integer primary key,
regiao_sigla varchar(2),
regiao_nome varchar(50));



DROP TABLE IF EXISTS estados CASCADE;

create table estados (
uf_codigo_ibge integer primary key,
uf_sigla varchar(2),
uf_nome  varchar(50),
regiao_codigo_ibge integer
); 

alter table estados add constraint fk_regiao FOREIGN KEY (regiao_codigo_ibge) REFERENCES regioes(regiao_codigo_ibge);


DROP TABLE IF EXISTS estados_dados_complementares CASCADE; 

CREATE table estados_dados_complementares(
uf_codigo_ibge integer  NOT NULL,
gentilico  varchar(150) NOT NULL  DEFAULT 'Não informado',	
capital varchar(50) NOT NULL ,
area_territorial decimal(18,4) CHECK (area_territorial > 0)
);

alter table estados_dados_complementares add constraint pk_estados_dados_complementares PRIMARY KEY (uf_codigo_ibge);
alter table estados_dados_complementares add constraint fk_estado_dadoscomplementares 
   FOREIGN KEY (uf_codigo_ibge) REFERENCES estados(uf_codigo_ibge);


DROP TABLE IF EXISTS estados_populacao CASCADE; 

CREATE table estados_populacao(
id serial primary key,
uf_codigo_ibge integer not null,
ano integer not null,
populacao_estimada integer);

alter table estados_populacao add constraint fk_estado_populacao
   FOREIGN KEY (uf_codigo_ibge) REFERENCES estados(uf_codigo_ibge);


create table estados_bioma_amazonia  (
uf_codigo_ibge integer primary key,
uf_sigla varchar(2),
uf_nome  varchar(50)
); 


alter table estados_bioma_amazonia add constraint fk_estado_biomas_amazonia
   FOREIGN KEY (uf_codigo_ibge) REFERENCES estados(uf_codigo_ibge);

DROP TABLE IF EXISTS inscricoes_evg CASCADE;

create table inscricoes_evg(
id serial primary key
, ano integer not null
, tematica_id integer not null
, tematica varchar(250) not null
, cod_curso integer not null
, nome_curso varchar(250) not null
, pessoa_uf_sigla varchar(2) not null
, esfera_id integer not null
, esfera varchar(50) not null
, poder_id integer not null
, poder varchar(50) not null
, sexo_id integer not null
, sexo varchar(50) not null
, situacao_matricula_id integer not null
, situacao_matricula varchar(50) not null
, situacao_turma_id integer not null
, situacao_turma varchar(50) not null
, faixa_idade_id integer not null
, faixa_idade varchar(50) not null
, inscricoes  integer not null);
  