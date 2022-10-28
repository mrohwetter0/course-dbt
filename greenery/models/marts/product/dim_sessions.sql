{{ 
  config(
    materialized='table'
  ) 
}}

with events as (

    select * from {{ ref('stg_events') }}

),

checkout_events as (

    select
        session_id
    from events
    where event_type = 'checkout'
    group by 1

),

final as (

    select 
        {{ dbt_utils.surrogate_key(['e.session_id', 'e.user_id', 'e.product_id']) }} as id,
        e.session_id,
        e.user_id,
        e.product_id,
        iff(ce.session_id is not null, True, False) as order_purchased,
        iff({{ event_type_agg( 'add_to_cart' ) }} > 0, True, False) as added_to_cart,
        iff(added_to_cart and order_purchased, True, False) as product_purchased

    from events e
    left join checkout_events ce 
        on e.session_id = ce.session_id
    where product_id is not null
    group by 1,2,3,4,5

)

select * from final