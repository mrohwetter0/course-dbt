{{ 
  config(
    materialized='table'
  ) 
}}

with orders as (

    select * from {{ ref('stg_orders') }}

)

select
    user_id,
    count(distinct order_id) as total_orders,
    sum(order_cost) as total_order_cost,
    sum(shipping_cost) as total_shipping_cost,
    sum(order_total) as total_order_total,
    min(created_at) as first_order,
    max(created_at) as last_order
    
from orders
group by 1