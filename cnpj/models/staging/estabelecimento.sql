{{ config(materialized='view',full_refresh=true,alias = 'dbt_estabelecimento') }}

SELECT *  FROM `infra-itaborai.mds_cnpj.estabelecimentos`