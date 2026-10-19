select * from {{ ref('job_hst') }} where job_id is null
                                 or start_date is null
                                 or end_date is null
                                 or start_date > end_date

