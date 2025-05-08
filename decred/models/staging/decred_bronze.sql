{{config(
    materialized = 'view',
    alias = 'decred_bronze',
    tags = ['decred', 'silver'],
    )
    }}

SELECT
  *,
  CONCAT(DS_OPERACAO_ANO,DS_OPERACAO_MES) AS PA
FROM {{ref('decred_raw')}}
  
