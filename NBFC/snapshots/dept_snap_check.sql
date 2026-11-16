{% snapshot dept_snap_check %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'department_id',
        strategy = 'check',
        check_cols = ['department_name','department_id'],
        hard_deletes='invalidate'
    )
}}

SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    MANAGER_ID,
    UPDATED_AT

FROM {{ source('hr1', 'DEPARTMENTS_snap') }}

{% endsnapshot %}