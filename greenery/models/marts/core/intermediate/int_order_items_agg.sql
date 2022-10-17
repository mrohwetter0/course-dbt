{{ 
  config(
    materialized='table'
  ) 
}}

with order_line_items as (

  select * from {{ ref('stg_order_items') }}

)

select
  order_id,
  count(distinct product_id) as distinct_products_in_order,
  sum(quantity) as total_items_in_order
  
from order_line_items
group by 1