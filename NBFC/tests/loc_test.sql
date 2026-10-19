select *
 from {{ ref('loc') }} 
 where location_id is null
 or city is null
