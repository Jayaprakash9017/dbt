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
-- where country_id = '{{ var('country_id') }}'
where country_id in (
    {% for country in var('country_id') %}
        '{{ country }}'{% if not loop.last %},{% endif %}
    {% endfor %}
)