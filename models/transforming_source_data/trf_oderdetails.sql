{{config(materialized='table',schema='trf_source')}}

select 

od.*,

(od.unitprice * od.quantity) * (1- od.discount) as linesalesamount,

p.unitcost * od.quantity as costofgoodssold,

((od.unitprice * od.quantity) * (1-od.discount))-(p.unitprice * od.quantity) as margin

from 

{{ ref('order_details')}} as od

inner join {{ref('trf_products')}} as p

on od.productid = p.productid