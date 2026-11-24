{{
    config(
        materialized = 'table',
        tags = ['insurance'],
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns',
        post_hook = "{{ remove_duplicates(
            'EMPLOYEE_ID',
            'employee_id'
        ) }}"
    )
}}

select 
EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
 from {{ source('hr1', 'EMPLOYEES') }}
