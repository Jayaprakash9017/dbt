{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'job_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
JOB_ID,
JOB_TITLE,
MIN_SALARY,
MAX_SALARY
 from {{ source('hr1', 'JOBS') }}  