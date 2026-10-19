{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'region_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
   REGION_ID,
   REGION_NAME 
from {{ source('hr1', 'REGIONS') }}    