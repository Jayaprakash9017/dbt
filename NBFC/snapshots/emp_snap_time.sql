{% snapshot emp_snap_time %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'EMPLOYEE_ID',
        strategy = 'timestamp',
        updated_at = 'UPDATED_AT'
    )
}}

SELECT
    EMPLOYEE_ID,
    EMPLOYEE_NAME,
    DEPARTMENT,
    SALARY,
    UPDATED_AT

FROM {{ source('hr1', 'EMPLOYEES_snap') }}

{% endsnapshot %}