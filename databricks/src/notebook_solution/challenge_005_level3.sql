-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso de uma transformação completa da tabela Customer<p>
-- MAGIC 1. concatene as colunas Customer.FirstName com Customer.LastName e gere uma coluna com a descrição nome onde apenas a primeira letra do nome seja Maiúscula.
-- MAGIC 2. concatene as colunas Customer.City com Customer.State e gere uma coluna com a descrição cidade onde apenas a coluna Customer.State seja Maiúscula. exemplo: belém-PA.
-- MAGIC 3. crie uma nova coluna denominada cep a partir da coluna Customer.PostalCode removendo todos os caracteres e convertendo o a coluna para o tipo de dados Integer.
-- MAGIC 4. a filtragem da tabela precisa pegar apenas os dados da país "BRAZIL" e o cep <> 0
-- MAGIC 
-- MAGIC Critério:
-- MAGIC e o critério principal é que voce escreva essa transformação em apenas uma query. Boa sorte
-- MAGIC 
-- MAGIC **resultado esperado:**
-- MAGIC 
-- MAGIC |codigo|	nome|	endereco|	cidade|	pais|	cep|	telefone|	Email|
-- MAGIC |-|-|-|-|-|-|-|-|
-- MAGIC |1|	    Luís gonçalves|	av. brigadeiro faria lima, 2170	|são josé dos campos-SP	|BRAZIL	|12227000	|551239235555	|luisg@embraer.com.br|
-- MAGIC |10|	Eduardo martins|	rua dr. falcão filho, 155	|são paulo-SP	|BRAZIL	|1007010	|551130335446	|eduardo@woodstock.com.br|
-- MAGIC |11|	Alexandre rocha|	av. paulista, 2022	|são paulo-SP	|BRAZIL	|1310200	|551130553278	|alero@uol.com.br|
-- MAGIC |12|	Roberto almeida|	praça pio x, 119	|rio de janeiro-RJ	|BRAZIL	|20040020	|552122717000	|roberto.almeida@riotur.gov.br|
-- MAGIC |13|	Fernanda ramos|	qe 7 bloco g	|brasília-DF	|BRAZIL	|71020677	|556133635547	|fernadaramos4@uol.com.br|
-- MAGIC 
-- MAGIC **Para resolução utilize esse link:** [Clique aqui](https://spark.apache.org/docs/latest/api/sql/index.html)
-- MAGIC 
-- MAGIC 
-- MAGIC **exemplo de query:**
-- MAGIC ```sql
-- MAGIC SELECT * from sqlite_db.customer
-- MAGIC ```

-- COMMAND ----------

SELECT * 
  FROM sqlite_db.customer
 LIMIT 5

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Solution Challenge 5 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

select CustomerId                                            AS codigo,
       concat(FirstName, SPACE(1), lower(LastName))	         AS nome,
       lower(Address)                                        AS endereco,
       concat(lower(City), "-", State)	                     AS cidade,
       upper(Country)                                        AS pais,
       CAST(regexp_replace(PostalCode, "[^0-9]", "") AS INT) AS cep,
       regexp_replace(Phone, "[^0-9]", "")                   AS telefone,
       Email
  from sqlite_db.customer
 where upper(Country) == 'BRAZIL'
   and CAST(regexp_replace(PostalCode, "[^0-9]", "") AS INT) <> 0