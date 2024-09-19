{{config(materialized= 'view',schema='reporting')}}

select 
orderid,

sum(case when LineNo = 1 then linesalesamount end) as lineno1_amount,
sum(case when LineNo = 2 then linesalesamount end) as lineno2_amount,
sum(case when LineNo = 3 then linesalesamount end) as lineno3_amount,
sum(linesalesamount) as total_amount

from 
{{ref('trf_oderdetails')}}

group by orderid
