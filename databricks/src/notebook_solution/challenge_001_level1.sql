-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Neste primeiro desafio super fácil, precisamos apenas dos registros do campo `sqlite_db.customer.Email` da tabela Customers onde o domínio seja da `apple`. <br>
-- MAGIC Crie uma query que retorne esse resultado e escreva uma breve explicação do código implementado:
-- MAGIC 
-- MAGIC 
-- MAGIC **Resultado esperado:**  
-- MAGIC 
-- MAGIC Email |
-- MAGIC -|
-- MAGIC astrid.gruber@apple.at| 
-- MAGIC daan_peeters@apple.be| 
-- MAGIC tgoyer@apple.com| 
-- MAGIC isabelle_mercier@apple.fr| 
-- MAGIC terhi.hamalainen@apple.fi| 
-- MAGIC ladislav_kovacs@apple.hu| 
-- MAGIC hughoreilly@apple.ie| 
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
 LIMIT 3

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC ### Solution Challenge 1 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

SELECT Email
  FROM sqlite_db.customer
 WHERE Email LIKE ("%@apple.%");