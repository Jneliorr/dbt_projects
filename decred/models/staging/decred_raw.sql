{{config(
    materialized = 'view',
    alias = 'decred_raw',
    tags = ['decred', 'raw'],
    )
    }}

    
SELECT
*
FROM `infra-itaborai.decred.decred`
