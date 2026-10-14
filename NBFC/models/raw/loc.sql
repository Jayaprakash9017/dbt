{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'location_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
LOCATION_ID,
STREET_ADDRESS,
POSTAL_CODE,
CITY,
STATE_PROVINCE,
COUNTRY_ID
 from {{ source('hr1', 'LOCATIONS')}}   