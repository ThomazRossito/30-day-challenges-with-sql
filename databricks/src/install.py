# Databricks notebook source
# script desenvolvido por Romerito Morais | Senior Data Engineer

import pandas

spark.sql("CREATE DATABASE IF NOT EXISTS sqlite_db;")

files=[
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Album.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Artist.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Customer.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Employee.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Genre.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Invoice.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/InvoiceLine.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/MediaType.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Playlist.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/PlaylistTrack.csv",
       "https://raw.githubusercontent.com/romeritomorais/30-day-challenges-with-sql/main/src/data/Track.csv"
]

class utils:
  
  def download():
    for i in files:
      Files = i.split("/")
      ListTable = Files[8].replace(".csv","")
      TableName = ListTable.lower()
      df = pandas.read_csv(i, sep=";")
      TableSpark = spark.createDataFrame(df)
      Table = f"sqlite_db.{TableName}"
      spark.sql(f"DROP TABLE IF EXISTS {Table}")
      TableSpark.write.format("delta").mode("overwrite").saveAsTable(f"{Table}")
      print(f"tabela {Table} criada!")
      
      
utils.download()