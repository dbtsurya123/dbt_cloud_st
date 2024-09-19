{% macro get_order_linenos() -%}
 
{% set lineno__query %}
select distinct
Lineno
from {{ ref('stg_orderdetails') }}
order by 1
{% endset %}
 
{% set results = run_query(lineno__query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
 
{%- endmacro %}