{{config(materialized= 'view',schema='reporting')}}

select 
orderid,

{% for each_lineno in [1,2,3] %}
sum(case when LineNo = {{each_lineno}} then linesalesamount end) as lineno_{{each_lineno}}_amount,
{% endfor %}

sum(linesalesamount) as total_amount

from 
{{ref('trf_oderdetails')}}

group by orderid
