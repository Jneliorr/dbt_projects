{{config(
    materialized = 'table',
    alias = 'hakuna_matata',
    tags = ['teste'],
    )
    }}

SELECT * FROM `teste2.teste_seed`