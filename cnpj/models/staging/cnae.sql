{{ config(materialized='view',full_refresh=true,alias = 'dbt_cnae') }}
    SELECT *
    FROM `infra-itaborai.mds_cnpj.cnae_servico`