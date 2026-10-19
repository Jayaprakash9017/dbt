{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'job_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
EMPLOYEE_ID,
START_DATE,
END_DATE,
JOB_ID,
DEPARTMENT_ID
 from {{ source('hr1','JOB_HISTORY' )}} 
