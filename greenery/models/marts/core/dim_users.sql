{{ 
  config(
    materialized='table'
  ) 
}}

with users as (

    select * from {{ ref('stg_users') }}

)
,
addresses as (

    select * from {{ ref('stg_addresses') }}

)

select
    u.user_id,
    u.first_name,
    u.last_name,
    u.first_name || ' ' || u.last_name as full_name,
    u.email,
    u.phone_number,
    u.created_at as user_created_at,
    u.updated_at as user_updated_at,
    a.address,
    a.zipcode,
    a.state,
    a.country
    
from users u
    left join addresses a on u.address_id = a.address_id