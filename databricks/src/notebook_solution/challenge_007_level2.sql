-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC ## Por favor tente resolver o desafio sozinho, não pegue atalhos, tu consegue, é só colocar a cabeça para funcionar.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Nesse desafio eu preciso que tu crie uma nova tabela chamada Track2 oriunda da transformação das tabelas: Track, Album, Artist e Genre <br> lembrando que a tabela que vai mandar no relacionamento é a tabela da esquerda Track aqui tu vai usar JOIN
-- MAGIC 
-- MAGIC Critério:
-- MAGIC que voce escreva essa transformação em apenas uma query. Boa sorte.
-- MAGIC 
-- MAGIC **Amostra esperada:**
-- MAGIC 
-- MAGIC |TrackId|	artista	|musica	|compositor	|genero	|size_mb|
-- MAGIC |-|-|-|-|-|-|
-- MAGIC |1	|AC/DC	|For Those About To Rock (We Salute You)	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	10908|
-- MAGIC |2	|Accept|	Balls to the Wall|		|Rock	|5381|
-- MAGIC |3	|Accept|	Fast As a Shark	|F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman|	Rock|	3897|
-- MAGIC |4	|Accept|	Restless and Wild	|F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman	|Rock|	4230|
-- MAGIC |5	|Accept|	Princess of the Dawn	|Deaffy & R.A. Smith-Diesel	|Rock|	6143|
-- MAGIC |6	|AC/DC	|Put The Finger On You	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	6556|
-- MAGIC |7	|AC/DC	|Let's Get It Up	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	7457|
-- MAGIC |8	|AC/DC	|Inject The Venom	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	6692|
-- MAGIC |9	|AC/DC	|Snowballed	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	6444|
-- MAGIC |10|AC/DC|	Evil Walks	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	8409|
-- MAGIC |11|	AC/DC|	C.O.D.	|Angus Young, Malcolm Young, Brian Johnson	|Rock|	6412|
-- MAGIC |12|	AC/DC|	Breaking The Rules	|Angus Young, Malcolm Young, Brian Johnson|	Rock	|8395|
-- MAGIC |13|	AC/DC|	Night Of The Long Knives	|Angus Young, Malcolm Young, Brian Johnson	|Rock	|6549|
-- MAGIC |14|	AC/DC|	Spellbound	|Angus Young, Malcolm Young, Brian Johnson	|Rock	|8610|
-- MAGIC |15|	AC/DC|	Go Down|	AC/DC	|Rock	|10593|
-- MAGIC |16|	AC/DC|	Dog Eat Dog	|AC/DC	|Rock	|6867|
-- MAGIC |17|	AC/DC|	Let There Be Rock	|AC/DC	|Rock	|11739|
-- MAGIC |18|	AC/DC|	Bad Boy Boogie	|AC/DC	|Rock	|8570|
-- MAGIC |19|	AC/DC|	Problem Child	|AC/DC	|Rock	|10368|
-- MAGIC |20|	AC/DC|	Overdose	|AC/DC	|Rock	|11783|
-- MAGIC |21|	AC/DC|	Hell Ain't A Bad Place To Be	|AC/DC	|Rock	|8136|
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
  FROM sqlite_db.track
 LIMIT 5

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Solution Challenge 7 - Thomaz Antonio Rossito Neto

-- COMMAND ----------

CREATE OR REPLACE TABLE Track2 
AS 
    SELECT tr.TrackId                 AS TrackId,
           at.Name                    AS artista,
           tr.Name                    AS musica,
           CASE 
                WHEN tr.Composer is null THEN ''      
           ELSE tr.Composer
           END                        AS compositor,
           ge.Name                    AS genero,
           CAST(tr.bytes/1024 AS INT) AS size_mb
      FROM sqlite_db.track AS tr
     INNER JOIN sqlite_db.genre AS ge
        ON tr.GenreId = ge.GenreId    
     INNER JOIN sqlite_db.album AS al
        ON tr.AlbumId = al.AlbumId
     INNER JOIN sqlite_db.Artist AS at
        ON al.ArtistId = at.ArtistId
     ORDER BY tr.TrackId;

-- COMMAND ----------

SELECT *
  FROM Track2