-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso que voce agrupe os dados da tabela Invoice e exiba apenas os valores maiores por Customer.CustomerId apenas do Brazil utilizando funções como: ROW_NUMBER e PARTITION
-- MAGIC 
-- MAGIC Critério:
-- MAGIC que voce escreva essa transformação em apenas uma query. Boa sorte.
-- MAGIC 
-- MAGIC **Resultado esperada:**
-- MAGIC 
-- MAGIC |CustomerId|	FirstName|	LastName|	country|	total|
-- MAGIC |-|-|-|-|-|
-- MAGIC |1	|Luís	|Gonçalves	|Brazil|	13.86|
-- MAGIC |10	|Eduardo	|Martins|	Brazil|	13.86|
-- MAGIC |11	|Alexandre	|Rocha	|Brazil|	13.86|
-- MAGIC |12	|Roberto	|Almeida|	Brazil|	13.86|
-- MAGIC |13	|Fernanda	|Ramos	|Brazil|	13.86|
-- MAGIC 
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