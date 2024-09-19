{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

select
concat(a.OrderID,a.LineNo) as id,a.OrderID,b.orderdate,a.LineNo,a.productid,a.Quantity,a.UnitPrice,a.Discount
from 
{{source('raw_dbt','order_details')}} a
join 
{{ref("stg_orders")}} b
on a.OrderID = b.OrderID

{% if is_incremental() %}
  where b.orderdate > (select max(orderdate) from {{this}})
{% endif %}