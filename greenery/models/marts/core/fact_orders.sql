{{ 
  config(
    materialized='table'
  ) 
}}

with orders as (

    select * from {{ ref('stg_orders') }}

)
,
order_items_agg as (

  select * from {{ ref('int_order_items_agg') }}

)

select 
  o.order_id,
  o.user_id,
  o.order_cost,
  o.shipping_cost,
  o.order_total,
  datediff('day', o.created_at, o.estimated_delivery_at) as estimated_days_to_ship,
  datediff('day', o.created_at, o.delivered_at) as actual_days_to_ship,
  oia.distinct_products_in_order,
  oia.total_items_in_order,
  row_number() over (partition by o.user_id order by o.created_at) as user_order_rank

from orders o
  left join order_items_agg oia on o.order_id = oia.order_id