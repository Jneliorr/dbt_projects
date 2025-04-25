{{ config(materialized='table',full_refresh=true) }}

SELECT a.*,
    b.*
EXCEPT(CNPJ_BASICO),
    c.*
EXCEPT(CNPJ_BASICO),
    d.cnae AS CNAE,
    d.tipo AS CLASIFICACAO_PRINCIPAL,
    d.descricao AS DESCRICAO_CNAE
FROM {{ref('estabelecimento')}} AS a
    LEFT JOIN {{ref('empresas')}} AS b on a.cnpj_BASICO = b.cnpj_basico
    LEFT JOIN {{ref('simples_nacional')}} AS c on a.cnpj_BASICO = c.cnpj_basico
    LEFT JOIN {{ref('cnae')}} AS d on a.CNAE_PRINCIPAL = d.cnae
WHERE 
  ('{{var("filtro_COD_TOM")}}' = "" OR a.MUNICIPIO = '{{var("filtro_COD_TOM")}}')
  AND 
  ('{{var("filtro_uf")}}' = "" OR a.UF = '{{var("filtro_uf")}}') 

-- dbt run --select cnpj_rj_petropolis --vars '{"filtro_COD_TOM": "5877"}'
