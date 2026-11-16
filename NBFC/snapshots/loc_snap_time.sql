{% snapshot loc_snap_time %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'location_id',
        strategy = 'timestamp',
        updated_at = 'UPDATED_AT',
        hard_deletes='invalidate'
    )
}}

SELECT
    LOCATION_ID,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    STATE_PROVINCE,
    COUNTRY_ID,
    UPDATED_AT

FROM {{ source('hr1', 'LOCATIONS_snap') }}

{% endsnapshot %}