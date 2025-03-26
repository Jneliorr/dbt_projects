{{config(materialized = 'table')}}
SELECT *,
(COALESCE(OP_CREDITO, 0) + COALESCE(OP_DEBITO, 0)) - (
    COALESCE(CAN_CREDITO, 0) + COALESCE(CAN_DEBITO, 0)
  ) AS VL_LIQUIDO
FROM {{ref('decred_bronze')}}