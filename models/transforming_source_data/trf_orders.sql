{{config(materialized = 'table',schema = 'trf_source')}}

select 
orderid,
customerid,
employeeid,
shipperid,
freight,
orderdate,
month(orderdate) as ordermonth,
year(orderdate) as orderyear

from 

{{ref('stg_orders')}}