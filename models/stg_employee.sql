{{ config(materialized = 'table',sort = 'empid') }}

with cte as (
    select * from {{ source('raw_dbt','employee') }}
)
select * from cte