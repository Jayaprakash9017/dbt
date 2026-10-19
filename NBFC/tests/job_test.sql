select * from {{ ref('job') }} where min_salary > max_salary
                             or job_id is null