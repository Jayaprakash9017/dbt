{{
    config(
        materialized = 'incremental',
        tags = ['Finance'],
        database = 'HR',
        unique_key = 'location_id',
        on_schema_change = 'append_new_columns',
        incremental_strategy = 'append'
    )
}}

select
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID,
    UPDATED_AT
 from {{ source('hr1', 'LOCATIONS_APP') }}

 {% if is_incremental() %}
where UPDATED_AT > (select max(UPDATED_AT) from {{ this }})
{% endif %}