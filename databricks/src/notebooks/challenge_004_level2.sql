-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso apenas de campos numericos dos dados da coluna Customer.PostalCode de 8 posições e do tipo inteiro.
-- MAGIC 
-- MAGIC **resultado esperado:**
-- MAGIC 
-- MAGIC |CustomerId	|Address	|State	|Country	Postal_Code|
-- MAGIC |-|-|-|-|
-- MAGIC |1|	Av. Brigadeiro Faria Lima, 2170	|SP|	Brazil|	12227000|
-- MAGIC |12|	Praça Pio X, 119	|RJ	|Brazil	|20040020|
-- MAGIC |13|	Qe 7 Bloco G	|DF	|Brazil	|71020677|
-- MAGIC |20|	541 Del Medio Avenue	|CA	|USA	|94040111|
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