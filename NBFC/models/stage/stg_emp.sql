{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
    e.employee_id, 
    e.first_name,
	e.last_name,
	d.department_name,
	e.salary,
	e.manager_id
from {{ ref('emp') }} e join {{ ref('dept')}} d 
    on e.department_id = d.department_id
    join {{ source('hr1', 'LOCATIONS') }} l 
    on d.location_id = l.location_id
