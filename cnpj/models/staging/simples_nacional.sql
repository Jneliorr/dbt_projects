{{ config(materialized='view',full_refresh=true, alias = 'dbt_simples_nacional') }}

SELECT * FROM `infra-itaborai.mds_cnpj.simples_nacional`