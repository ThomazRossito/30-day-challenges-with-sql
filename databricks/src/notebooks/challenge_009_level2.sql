-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Neste desafio precisamos que seja feito uma operação de UPDATE na coluna Customer.Company onde o campo Customer.Company nullo recebe o valor "xxxxxxxxxxxx"
-- MAGIC 
-- MAGIC Critério:
-- MAGIC Escreva essa transformação em apenas uma query. Boa sorte!
-- MAGIC 
-- MAGIC resultado esperado:
-- MAGIC 
-- MAGIC |CustomerId	|FirstName	|LastName	|Company|	Address|
-- MAGIC |-|-|-|-|-|
-- MAGIC |1	|Luís	|Gonçalves	|Embraer - Empresa Brasileira de Aeronáutica S.A.|	Av. Brigadeiro F|
-- MAGIC |2	|Leonie	|Köhler	|xxxxxxxxxxxx|	Theodor-Heuss-St|
-- MAGIC |3	|François	|Tremblay	|xxxxxxxxxxxx|	1498 rue Bélange|
-- MAGIC |4	|Bjørn	|Hansen	|xxxxxxxxxxxx|	Ullevålsveien 14|
-- MAGIC |5	|František	|Wichterlová	|JetBrains s.r.o.|	Klanova 9/506
-- MAGIC |6	|Helena	|Holý	|xxxxxxxxxxxx	|Rilská 3174/6|
-- MAGIC |7	|Astrid	|Gruber	|xxxxxxxxxxxx	|Rotenturmstraße|
-- MAGIC |8	|Daan	|Peeters	|xxxxxxxxxxxx	|Grétrystraat 63|
-- MAGIC |9	|Kara	|Nielsen	|xxxxxxxxxxxx|	Sønder Boulevard|
-- MAGIC |10 |Eduardo	|Martins	|Woodstock Discos|	Rua Dr. Falcão F|
-- MAGIC |11 |Alexandre	|Rocha	|Banco do Brasil S.A.|	Av. Paulista, 20|
-- MAGIC |12 |Roberto	|Almeida	|Riotur|	Praça Pio X, 119|
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