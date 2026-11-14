{{
    config(
        materialized = 'incremental',
        tags = ['Finance'],
        database = 'HR',
        unique_key = 'department_id',
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
  
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    LOCATION_ID,
    UPDATED_AT
 from {{ source('hr1', 'DEPARTMENTS_inc') }}

 {% if is_incremental() %}
where department_id=50
{% endif %}
