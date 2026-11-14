{{
    config(
        materialized = 'incremental',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns', 
        incremental_strategy = 'insert_overwrite',
        partition_by = {
            'field': 'department_id',
            'data_type': 'int64',
            'range': {
                'start': 10,
                'end': 50,
                'interval': 10
            }
        }

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
where department_id=20
{% endif %}
