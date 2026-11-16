{% snapshot dept_snap_time %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'department_id',
        strategy = 'timestamp',
        updated_at = 'UPDATED_AT',
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