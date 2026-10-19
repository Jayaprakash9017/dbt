select * from {{ ref('dept') }} where department_name is null 
                          or department_id <= 0