{{ config(materialized="table", schema="salesmart") }}
 
with t_cust as
(
    select * exclude stateprovince
from {{ ref("trf_customer") }}
),
 
lpk_d as
(
    select * from {{ ref("lpk_divisions") }}
),
 
final as (
    select c.*, d.divisionname
from t_cust c
join lpk_d d on c.divisionid = d.divisionid
)
 
select * from final