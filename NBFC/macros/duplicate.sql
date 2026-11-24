{% macro remove_duplicates(unique_key, updated_at_column) %}

    DELETE FROM {{ this }}
    WHERE {{ unique_key }} IN (

        SELECT {{ unique_key }}
        FROM (
            SELECT
                {{ unique_key }},
                ROW_NUMBER() OVER (
                    PARTITION BY {{ unique_key }}
                    ORDER BY {{ updated_at_column }} DESC
                ) AS row_num
            FROM {{ this }}
        ) duplicate_records
        WHERE row_num > 1

    )

{% endmacro %}