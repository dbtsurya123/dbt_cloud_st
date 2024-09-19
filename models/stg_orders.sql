{{ config( materialized='incremental') }}

select
    *
from {{ source('raw_dbt','orders') }}

{% if is_incremental() %}
where orderdate > (select max(orderdate) from {{ this }} )
{% endif %}