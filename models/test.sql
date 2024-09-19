with cte as (
    select * from {{ source('raw_dbt','customers') }}
)

select * from cte