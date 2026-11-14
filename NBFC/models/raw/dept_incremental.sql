{{
    config(
        materialized = 'incremental',
        tags = ['Finance'],
        database = 'HR',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns',
        incremental_strategy = 'merge'
    )
}}

select
  
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID,
    UPDATED_AT
 from {{ source('hr1', 'DEPARTMENTS_inc') }}

 {% if is_incremental() %}
where UPDATED_AT > (select max(UPDATED_AT) from {{ this }})
{% endif %}
