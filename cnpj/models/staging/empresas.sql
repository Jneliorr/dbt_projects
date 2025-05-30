{{ config(materialized='view',full_refresh=true,alias='dbt_empresas') }}

SELECT * FROM `infra-itaborai.mds_cnpj.empresa`