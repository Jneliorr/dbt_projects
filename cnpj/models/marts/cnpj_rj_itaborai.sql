{{ config(materialized='table',full_refresh=true, alias='dbt_cnpj_itaborai') }}

SELECT 
    -- a.SITUACAO_CADASTRAL,e.DESCRICAO_SITUACAO,
    -- B.QUALIFICACAO_RESPONSAVEL,f.descricao,
    -- b.COD_PORTE_EMPRESA,g.desc_porte,
    -- a.pais,h.nome_pais,
    -- b.COD_NATUREZA_JUR,
    -- i.desc_natureza_juridica,
    -- a.municipio,
    -- j.descricao,
    -- a.motivo_situacao,
    -- k.desc_motivo,


    a.CNPJ_BASICO,
    a.CNPJ_ORDEM,
    a.CNPJ_DV,
    a.MATRIZ_FILIAL,
    a.NOME_FANTASIA,
    a.SITUACAO_CADASTRAL,
    e.DESCRICAO_SITUACAO,
    a.DATA_SITUACAO_CADASTRAL,
    a.MOTIVO_SITUACAO,
    k.desc_motivo AS DESC_SITUACAO,
    a.NOME_CIDADE_EXT,
    a.PAIS,
    h.nome_pais AS DESC_PAIS,
    a.Data_Inicio_Atividade AS DATA_INICIO_ATIVIDADE,
    a.CNAE_PRINCIPAL,
    a.CNAE_SECUNDARIA,
    a.TIPO_LOGRADOURO,
    a.LOGRADOURO,
    a.NUM,
    a.COMPLEMENTO,
    a.BAIRRO,
    a.CEP,
    a.UF,
    a.MUNICIPIO,
    j.descricao AS DESC_MUNICIPIO,
    a.DDD1,
    a.TEL1,
    a.DDD2,
    a.TEL2,
    a.DDD_FAX,
    a.TEL_FAX,
    a.E_MAIL,
    a.SITUACAO_ESPECIAL,
    a.DATA_SIT_ESPECIAL,
    a.CNPJ_COMPLETO,
    
    -- b.CNPJ_BASICO,
    b.RAZAO_SOCIAL,
    b.COD_NATUREZA_JUR,
    i.desc_natureza_juridica AS DESC_NATUREZA_JURIDICA,
    b.QUALIFICACAO_RESPONSAVEL,
    f.descricao AS DESC_RESPONSAVEL,
    b.CAPITAL_SOCIAL,
    b.COD_PORTE_EMPRESA,
    g.desc_porte AS DESC_PORTE,
    b.ENTE_RESPONSAVEL,



    -- c.CNPJ_BASICO,
    c.OPCAO_PELO_SIMPLES,
    c.DATA_OPCAO_SIMPLES,
    c.DATA_EXCLUSAO_DO_SIMPLES,
    c.OPCAO_PELO_MEI,
    c.DATA_OPCAO_MEI,
    c.DATA_EXCLUSAO_DO_MEI,


    d.cnae AS CNAE,
    d.descricao AS DESCRICAO_CNAE,
    -- d_anexo AS ANEXO,
    d.tipo AS CLASIFICACAO_PRINCIPAL
    
FROM {{ref('estabelecimento')}} AS a
    LEFT JOIN {{ref('empresas')}} AS b on a.cnpj_BASICO = b.cnpj_basico
    LEFT JOIN {{ref('simples_nacional')}} AS c on a.cnpj_BASICO = c.cnpj_basico
    LEFT JOIN {{ref('cnae')}} AS d on a.CNAE_PRINCIPAL = d.cnae
    LEFT JOIN infra-itaborai.mds_cnpj.d_situacao_cadastral AS e on a.SITUACAO_CADASTRAL = e.id_situacao
    LEFT JOIN infra-itaborai.mds_cnpj.d_qualifsocio as f on B.QUALIFICACAO_RESPONSAVEL = f.id
    LEFT join infra-itaborai.mds_cnpj.d_porte as g on b.COD_PORTE_EMPRESA = g.id_porte
    LEFT JOIN infra-itaborai.mds_cnpj.d_pais as h on a.pais = h.id_pais
    LEFT JOIN infra-itaborai.mds_cnpj.d_natjuridica as i on b.COD_NATUREZA_JUR = i.id_natureza_juridica
    left join infra-itaborai.mds_cnpj.d_municipio as j on a.MUNICIPIO = j.id
    left join infra-itaborai.mds_cnpj.d_motivo as k on a.motivo_situacao = k.id_motivo

WHERE 
  ('{{var("filtro_COD_TOM")}}' = "" OR a.MUNICIPIO = '{{var("filtro_COD_TOM")}}')
  AND 
  ('{{var("filtro_uf")}}' = "" OR a.UF = '{{var("filtro_uf")}}') 



-- dbt run --select cnpj_rj_itaborai --vars '{"filtro_municipio": "5837", "filtro_uf": "RJ"}' && dbt run --exclude cnpj_rj_itaborai
-- dbt run --select cnpj_rj_itaborai --vars '{"filtro_COD_TOM": "5837"}'
