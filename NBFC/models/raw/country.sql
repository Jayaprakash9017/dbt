{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'country_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
COUNTRY_ID,
COUNTRY_NAME,
REGION_ID
 from {{ source('hr1', 'COUNTRIES') }}  