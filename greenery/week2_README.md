- What is our user repeat rate?
> 79.8%

    with user_orders as (
        select
            user_id,
            count(distinct order_id) as orders_placed
        from dev_db.dbt_mrohwetter.stg_orders
        group by 1
    )

    select
        count(distinct iff(orders_placed >= 2, user_id, null)) / count(distinct user_id) as repeat_rate
    from user_orders

- Good indicators of repeat purchasing:
> First order size
> What they purchased for their first order
> Marketing acquisition channel
> Time of year they purchased
> Was there a fulfillment issue?
> Was placing the order easy?

- Bad indicators of repeat purchasing:
> There was a fulfillment issue
> First order size
> What they ordered
> Marketing acuisition channel
> They wanted to return their order
> Received bad customer service
> Was placing the order hard?

- More data? Exploration? 
> Customer service data is usually really interesting. How long were they on hold when they called? How did they rate the call? First call resolution rate? Were we able to solve the problem in a painless way? Did we offer compensation? 
> Specific marketing data is usually pretty indictaive of the quality of a customer. 
> How is our website conversion? Is the checkout process fast enough?
> Does our webpage load fast enough?