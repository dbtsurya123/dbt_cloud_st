{{ config(materialized = 'table')}}

with p_cte as (
    select * from {{ source('raw_dbt','products') }}
)
select * from p_cte