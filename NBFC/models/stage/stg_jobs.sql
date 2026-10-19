{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'job_id',
        on_schema_change = 'append_new_columns'
    )
}}

select
    j.job_title,
    j.job_id,
    jh.department_id

from {{ ref('job')}} j join {{ ref('job_hst')}} jh
    on j.job_id = jh.job_id