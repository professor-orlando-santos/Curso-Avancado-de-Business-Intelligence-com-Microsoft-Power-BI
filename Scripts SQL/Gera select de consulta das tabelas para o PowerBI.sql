--Gerar os selects para todas as tabelas do DW a ser importadas para o Power BI
select 
chr(10) || chr(10) || 'Select ' || colunas_com_alias || chr(10) || 
'from ' || esquema || '.' || tabela || chr(10) || 
'order by ' || colunas || chr(10)|| chr(10)
from (
	select esquema, tabela
	, STRING_AGG (
		 c.coluna || ' as ' || '"' || initcap(replace(c.coluna,'_',' ')) || '"',
			', '
		   ORDER BY
			c.posicao) as colunas_com_alias
	, STRING_AGG (
		c.coluna,
			', '
		   ORDER BY
			c.posicao) as colunas
	from (
		select table_schema as esquema
		, table_name as tabela
		, column_name  as coluna
		, column_name || 'as' || column_name  as coluna_com_alias
		,ordinal_position as posicao
		from information_schema.columns 
		where table_schema = 'evg'
		order by table_name, ordinal_position
		) as c
	group by esquema, tabela
) as t


