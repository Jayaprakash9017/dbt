{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
DEPARTMENT_ID,
DEPARTMENT_NAME,
MANAGER_ID,
LOCATION_ID
 from {{ source('hr1', 'DEPARTMENTS') }}    