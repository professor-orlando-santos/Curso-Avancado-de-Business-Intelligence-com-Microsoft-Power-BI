/*Crição do banco de dados   */


CREATE DATABASE bd_estados_brasil;


DROP SCHEMA IF EXISTS brasil cascade;


CREATE SCHEMA brasil;


CREATE table regioes (
regiao_codigo_ibge integer primary key,
regiao_sigla varchar(2),
regiao_nome varchar(50));



create table estados (
uf_codigo_ibge integer primary key,
uf_sigla varchar(2),
uf_nome  varchar(50),
regiao_codigo_ibge integer
); 

alter table estados add constraint fk_regiao FOREIGN KEY (regiao_codigo_ibge) REFERENCES regioes(regiao_codigo_ibge);


drop table estados_dados_complementares;
CREATE table estados_dados_complementares(
uf_codigo_ibge integer  NOT NULL,
gentilico  varchar(150) NOT NULL  DEFAULT 'Não informado',	
capital varchar(50) NOT NULL ,
area_territorial_km decimal(18,4) CHECK (area_territorial_km > 0)
);

alter table estados_dados_complementares add constraint pk_estados_dados_complementares PRIMARY KEY (uf_codigo_ibge);
alter table estados_dados_complementares add constraint fk_estado_dadoscomplementares 
   FOREIGN KEY (uf_codigo_ibge) REFERENCES estados(uf_codigo_ibge);


CREATE table estados_populacao(
id serial primary key,
uf_codigo_ibge integer,
ano_referencia integer,
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
   
   
/*  Importação dos registros */
   
   
insert into regioes (regiao_codigo_ibge, regiao_sigla, regiao_nome )
values(1 ,'N','Norte' );
insert into regioes (regiao_codigo_ibge, regiao_sigla, regiao_nome )
values(2 ,'NE','Nordeste' );
insert into regioes (regiao_codigo_ibge, regiao_sigla, regiao_nome )
values(3 ,'SE','Sudeste' );
insert into regioes (regiao_codigo_ibge, regiao_sigla, regiao_nome )
values(4 ,'S','Sul' );
insert into regioes (regiao_codigo_ibge, regiao_sigla, regiao_nome )
values(5 ,'CO','Centro-Oeste' );

select * from regioes;


insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(99, 'NI', 'Não informado',null );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(11, 'RO', 'Rondônia',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(12, 'AC', 'Acre',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(13, 'AM', 'Amazonas',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(14, 'RR', 'Roraima',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(15, 'PA', 'Pará',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(16, 'AP', 'Amapá',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(17, 'TO', 'Tocantins',1 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(21, 'MA', 'Maranhão',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(22, 'PI', 'Piauí',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(23, 'CE', 'Ceará',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(24, 'RN', 'Rio Grande do Norte',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(25, 'PB', 'Paraíba',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(26, 'PE', 'Pernambuco',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(27, 'AL', 'Alagoas',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(28, 'SE', 'Sergipe',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(29, 'BA', 'Bahia',2 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(31, 'MG', 'Minas Gerais',3 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(32, 'ES', 'Espírito Santo',3 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(33, 'RJ', 'Rio de Janeiro',3 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(35, 'SP', 'São Paulo',3 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(41, 'PR', 'Paraná',4 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(42, 'SC', 'Santa Catarina',4 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(43, 'RS', 'Rio Grande do Sul',4 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(50, 'MS', 'Mato Grosso do Sul',5 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(51, 'MT', 'Mato Grosso',5 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(52, 'GO', 'Goiás',5 );
insert into estados (uf_codigo_ibge, uf_sigla, uf_nome, regiao_codigo_ibge)
values(53, 'DF', 'Distrito Federal',5 );


select * from estados;



insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (11, 'Rondoniense Ou Rondoniano', 'Porto Velho' , 237765.347);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (12, 'Acriano', 'Rio Branco' , 164173.431);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (13, 'Amazonense', 'Manaus' , 1559167.878);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (14, 'Roraimense', 'Boa Vista' , 223644.527);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (15, 'Paraense', 'Belém' , 1245870.707);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (16, 'Amapaense', 'Macapá' , 142470.762);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (17, 'Tocantinense', 'Palmas' , 277423.63);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (21, 'Maranhense', 'São Luís' , 329651.495);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (22, 'Piauiense', 'Teresina' , 251755.485);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (23, 'Cearense', 'Fortaleza' , 148894.442);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (24, 'Potiguar Ou Norte-Rio-Grandense Ou Rio-Grandense-Do-Norte', 'Natal' , 52809.601);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (25, 'Paraibano', 'João Pessoa' , 56467.242);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (26, 'Pernambucano', 'Recife' , 98067.88);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (27, 'Alagoano', 'Maceió' , 27830.656);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (28, 'Sergipano Ou Sergipense', 'Aracaju' , 21938.184);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (29, 'Baiano', 'Salvador' , 564760.427);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (31, 'Mineiro', 'Belo Horizonte' , 586513.993);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (32, 'Capixaba Ou Espírito-Santense', 'Vitória' , 46074.447);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (33, 'Fluminense', 'Rio De Janeiro' , 43750.426);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (35, 'Paulista', 'São Paulo' , 248219.481);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (41, 'Paranaense', 'Curitiba' , 199298.982);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (42, 'Catarinense Ou Barriga-Verde', 'Florianópolis' , 95730.684);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (43, 'Gaúcho Ou Sul-Rio-Grandense', 'Porto Alegre' , 281707.149);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (50, 'Sul-Mato-Grossense Ou Mato-Grossense-Do-Sul', 'Campo Grande' , 357147.994);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (51, 'Mato-Grossense', 'Cuiabá' , 903207.05);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (52, 'Goiano', 'Goiânia' , 340242.854);
insert into estados_dados_complementares ( uf_codigo_ibge, gentilico, capital, area_territorial_km ) 
values (53, 'Brasiliense', 'Brasília' , 5760.784);

select * from estados_dados_complementares;

insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (11 ,2011 , 1576455 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (11 ,2021 , 1815278 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (12 ,2011 , 746386 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (12 ,2021 , 906876 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (13 ,2011 , 3538387 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (13 ,2021 , 4269995 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (14 ,2011 , 460165 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (14 ,2021 , 652713 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (15 ,2011 , 7688593 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (15 ,2021 , 8777124 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (16 ,2011 , 684309 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (16 ,2021 , 877613 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (17 ,2011 , 1400892 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (17 ,2021 , 1607363 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (21 ,2011 , 6645761 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (21 ,2021 , 7153262 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (22 ,2011 , 3140328 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (22 ,2021 , 3289290 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (23 ,2011 , 8530155 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (23 ,2021 , 9240580 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (24 ,2011 , 3198657 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (24 ,2021 , 3560903 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (25 ,2011 , 3791315 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (25 ,2021 , 4059905 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (26 ,2011 , 8864906 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (26 ,2021 , 9674793 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (27 ,2011 , 3143384 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (27 ,2021 , 3365351 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (28 ,2011 , 2089819 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (28 ,2021 , 2338474 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (29 ,2011 , 14097534 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (29 ,2021 , 14985284 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (31 ,2011 , 19728701 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (31 ,2021 , 21411923 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (32 ,2011 , 3547055 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (32 ,2021 , 4108508 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (33 ,2011 , 16112678 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (33 ,2021 , 17463349 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (35 ,2011 , 41587182 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (35 ,2021 , 46649132 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (41 ,2011 , 10512349 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (41 ,2021 , 11597484 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (42 ,2011 , 6317054 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (42 ,2021 , 7338473 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (43 ,2011 , 10733030 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (43 ,2021 , 11466630 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (50 ,2011 , 2477542 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (50 ,2021 , 2839188 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (51 ,2011 , 3075936 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (51 ,2021 , 3567234 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (52 ,2011 , 6080716 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (52 ,2021 , 7206589 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (53 ,2011 , 2609998 );
insert into estados_populacao( uf_codigo_ibge, ano_referencia, populacao_estimada)
values (53 ,2021 , 3094325 );

		

   
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(11, 'RO', 'Rondônia' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(12, 'AC', 'Acre' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(13, 'AM', 'Amazonas' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(14, 'RR', 'Roraima' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(15, 'PA', 'Pará' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(16, 'AP', 'Amapá' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(17, 'TO', 'Tocantins' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(21, 'MA', 'Maranhão' );
insert into estados_bioma_amazonia (uf_codigo_ibge, uf_sigla, uf_nome)
values(51, 'MT', 'Mato Grosso' );
