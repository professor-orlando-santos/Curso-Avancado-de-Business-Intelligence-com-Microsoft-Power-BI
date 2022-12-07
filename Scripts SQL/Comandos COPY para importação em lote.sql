cd C:\Program Files\PostgreSQL\10\bin
biavancado

psql -U postgres -d bd_estados_brasil -c ^"\COPY regioes ^
 (regiao_codigo_ibge, regiao_nome, regiao_sigla) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/Regioes.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;"

psql -U postgres -d bd_estados_brasil -c ^"\COPY estados ^
 (uf_codigo_ibge, uf_nome, uf_sigla, regiao_codigo_ibge) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/Estados.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;

psql -U postgres -d bd_estados_brasil -c ^"\COPY estados_dados_complementares ^
 (uf_codigo_ibge,gentilico,capital,area_territorial) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/Estados Dados Complementares.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;

psql -U postgres -d bd_estados_brasil -c ^"\COPY estados_populacao ^
 (uf_codigo_ibge,ano,populacao_estimada) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/População Estimada.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;
 

psql -U postgres -d bd_estados_brasil -c ^"\COPY estados_servidores_publicos ^
 (uf_codigo_ibge, ano, esfera, poder,quantidade_de_vinculos) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/Servidores Públicos nos Estados.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;
 
 


 psql -U postgres -d bd_estados_brasil -c ^"\COPY estados_bioma_amazonia ^
 (uf_codigo_ibge, uf_sigla, uf_nome) ^
 from  'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/Estados com bioma da amazônia.csv' ^
 WITH DELIMITER ',' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;
 
  
 
 

psql -U postgres -d bd_estados_brasil -c ^"\COPY inscricoes_evg ^
 (ano, tematica_id, tematica, cod_curso, nome_curso, ^
 pessoa_uf_sigla, esfera_id, esfera, poder_id, ^
 poder, sexo_id, sexo, situacao_matricula_id, ^
 situacao_matricula, situacao_turma_id, ^
 situacao_turma, faixa_idade_id, faixa_idade, inscricoes) ^
 FROM 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/EVG-DadosResumidos.csv' ^
 WITH DELIMITER ';' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;" 
 
 --Podemos também exportar dados do banco com essa funcionalidade
 psql -U postgres -d bd_estados_brasil -c ^"\COPY inscricoes_evg ^
 (ano, tematica_id, tematica, cod_curso, nome_curso, ^
 pessoa_uf_sigla, esfera_id, esfera, poder_id, ^
 poder, sexo_id, sexo, situacao_matricula_id, ^
 situacao_matricula, situacao_turma_id, ^
 situacao_turma, faixa_idade_id, faixa_idade, inscricoes) ^
 to 'C:/proforlandosantos/Curso-de-Power-BI-Avançado/Dados/EVG-DadosResumidos-Exportado.csv' ^
 WITH DELIMITER ';' ^
 ENCODING 'UTF-8' ^
 CSV HEADER;" 
 
