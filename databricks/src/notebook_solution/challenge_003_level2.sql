-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso da contagem distinta dos dados da coluna Customer.City onde a contagem é >= a 2 linhas e por ordem alfabetica.
-- MAGIC 
-- MAGIC **resultado esperado:**
-- MAGIC 
-- MAGIC |City|numero_de_linhas|
-- MAGIC |-|-|
-- MAGIC |Berlin|	2|
-- MAGIC |London|	2|
-- MAGIC |Mountain View|	2|
-- MAGIC |Paris|	2|
-- MAGIC |Prague|	2|
-- MAGIC |São Paulo|	2|
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
-- MAGIC ### Solution Challenge 3 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

SELECT City,
       COUNT(City) AS numero_de_linhas
  FROM sqlite_db.customer
 GROUP BY City
HAVING COUNT(City) > 1
 ORDER BY City