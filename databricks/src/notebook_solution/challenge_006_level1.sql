-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso da idade das pessoas da tabela Employee use a coluna BithDate para a transformação.
-- MAGIC 
-- MAGIC Critério:
-- MAGIC que voce escreva essa transformação em apenas uma query. Boa sorte.
-- MAGIC 
-- MAGIC **resultado esperado:**
-- MAGIC 
-- MAGIC |LastName|	ano_de_nascimento|	idade|
-- MAGIC |-|-|-|
-- MAGIC |Adams|1962|60|
-- MAGIC |Callahan|1968|54|
-- MAGIC |Edwards|1958|64|
-- MAGIC |Johnson|1965|57|
-- MAGIC |King|1970|52|
-- MAGIC |Mitchell|1973|49|
-- MAGIC |Park|1947|75|
-- MAGIC |Peacock|1973|49|
-- MAGIC 
-- MAGIC 
-- MAGIC 
-- MAGIC **Para resolução utilize esse link:** [Clique aqui](https://spark.apache.org/docs/latest/api/sql/index.html)
-- MAGIC 
-- MAGIC 
-- MAGIC **exemplo de query:**
-- MAGIC ```sql
-- MAGIC SELECT * from sqlite_db.employee
-- MAGIC ```

-- COMMAND ----------

SELECT * 
  FROM sqlite_db.employee
 LIMIT 5

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Solution Challenge 6 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

SELECT LastName,
       YEAR(BirthDate)                                                  AS ano_de_nascimento,
       CAST(YEAR(CURRENT_DATE()) AS INT) - CAST(YEAR(BirthDate) AS INT) AS idade
  FROM sqlite_db.employee
 ORDER BY LastName