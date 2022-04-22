-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio super fácil, eu preciso dos registros onde o primeiro caracter seja o "A" e o terceiro "e" da coluna FirstName <br>
-- MAGIC tu vai criar uma query que traga esse resultado e uma breve explicação da implementação do código e descrever a query abaixo:
-- MAGIC 
-- MAGIC **Resultado esperada:**
-- MAGIC 
-- MAGIC |FirstName|
-- MAGIC |-|
-- MAGIC |Alexandre|
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
-- MAGIC ### Solution Challenge 2 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

SELECT FirstName
  FROM sqlite_db.customer
 WHERE FirstName LIKE 'A_e%'