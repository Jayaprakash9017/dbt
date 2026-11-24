{{
    config(
        materialized = 'table',
        tags = ['insurance'],
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
   {{ cal_bonus('salary') }} AS bonus,

   salary + {{ cal_bonus('salary') }} AS Total_Salary,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID
 from {{ source('hr1', 'EMPLOYEES') }}
