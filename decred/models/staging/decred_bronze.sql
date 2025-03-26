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
WHERE
  DS_OPERACAO_ANO = '2023'
  AND DS_OPERACAO_MES IN ('01', '02')
