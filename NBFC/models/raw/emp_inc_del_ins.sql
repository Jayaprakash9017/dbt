{{
    config(
        materialized = 'incremental',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns', 
        incremental_strategy = 'delete+insert'
    )
}}

select 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    DEPARTMENT_ID,
    SALARY,
    UPDATED_AT
 from {{ source('hr1', 'EMPLOYEES_inc') }}

 {% if is_incremental() %}
where UPDATED_AT > (select max(UPDATED_AT) from {{ this }})
{% endif %}
