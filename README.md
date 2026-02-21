# DBT_Lab
This repo keep all data from snowflake and dbt in learning path

-- 1. When I try to connect between DBT and databrick, I found a problem connection
-- Solving : I come back to connection settings in DBT and edit catalog by, I wrote catalog name as we wanna use
--           in this case is raw, after that I will try to test connection and DBT run to test they can run al SQL file in object and sve in target path
--           by default if we except in catalog they will use 'hive_metastore' it's legacy version for Databricks.
