{{config(materialized = 'table',schema = 'staging')}}

select 
office as officeID,
officeaddress as address,
officepostalcode as postalcode,
officecity as city,
officestateprovince as stateprovince,
officephone as phone,
officefax as fax,
officecountry as country

from {{ source('raw_dbt','office')}}