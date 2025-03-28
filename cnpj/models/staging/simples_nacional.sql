{{ config(materialized='view',full_refresh=true) }}
SELECT *     FROM `cnpj_rfb.simples_nacional`