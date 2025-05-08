{{config(
    materialized = 'view',
    alias = 'decred_raw',
    tags = ['decred', 'raw'],
    )
    }}

    
SELECT
*,
  CASE
  WHEN DS_OPERACAO_TIPO_NATUREZA = 'Crédito' THEN 'Crédito'
  WHEN DS_OPERACAO_TIPO_NATUREZA = 'CrÃ©dito' THEN 'Crédito'
  WHEN DS_OPERACAO_TIPO_NATUREZA = 'Débito' THEN 'Débito'
  WHEN DS_OPERACAO_TIPO_NATUREZA = 'DÃ©bito' THEN 'Débito'
  end as DS_OPERACAO_TIPO_NATUREZA_OK
FROM `infra-itaborai.mds_decred.decred`

