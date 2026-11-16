{% snapshot loc_snap_check %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'location_id',
        strategy = 'check',
        check_cols = ['street_address', 'postal_code', 'city', 'state_province', 'country_id'],
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