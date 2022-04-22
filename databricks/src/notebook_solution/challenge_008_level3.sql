-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso que voce agrupe os dados da tabela `Invoice` e exiba apenas os valores maiores por `Customer.CustomerId` apenas do Brazil utilizando funções como: ROW_NUMBER e PARTITION
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

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Solution Challenge 8 - Thomaz Antonio Rossito Neto
-- MAGIC - Sub Select
-- MAGIC - CTE

-- COMMAND ----------

-- Sub Select

SELECT CustomerId,
       FirstName,
       LastName,
       country,
       total  
  FROM (
        SELECT ROW_NUMBER() OVER(PARTITION BY iv.CustomerId ORDER BY total DESC) AS Row,   
               iv.CustomerId  AS CustomerId,
               ct.FirstName   AS FirstName,
               ct.LastName    AS LastName,
               country        AS country,
               round(total,2) AS total        
          FROM sqlite_db.invoice AS iv
         INNER JOIN sqlite_db.customer AS ct
            ON iv.CustomerId = ct.CustomerId
         WHERE country = 'Brazil' 
        )  
 WHERE Row = 1       

-- COMMAND ----------

-- CTE (Common Table Expression)

WITH customer_rank_total
AS
    (
      SELECT ROW_NUMBER() OVER(PARTITION BY iv.CustomerId ORDER BY total DESC) AS Row,   
             iv.CustomerId  AS CustomerId,
             ct.FirstName   AS FirstName,
             ct.LastName    AS LastName,
             country        AS country,
             round(total,2) AS total        
        FROM sqlite_db.invoice AS iv
       INNER JOIN sqlite_db.customer AS ct
          ON iv.CustomerId = ct.CustomerId
       WHERE country = 'Brazil'
    )
  
SELECT CustomerId,
       FirstName,
       LastName,
       country,
       total  
  FROM customer_rank_total
 WHERE Row = 1       