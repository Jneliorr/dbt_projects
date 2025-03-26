{{config(materialized = 'view')}}

SELECT
  *,
  CONCAT(DS_OPERACAO_ANO,DS_OPERACAO_MES) AS PA
FROM {{ref('decred_geral')}}
WHERE
  DS_OPERACAO_ANO = '2023'
  AND DS_OPERACAO_MES IN ('01', '02')
