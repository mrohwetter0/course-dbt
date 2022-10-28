- What is our overall conversion rate?
> 62.4%

    select 
        count(distinct iff(product_purchased, session_id, null)) / count(distinct session_id) as overall_conversion_rate
    from dev_db.dbt_mrohwetter.dim_sessions

- What is our conversion rate by product?

    | NAME | PRODUCT_ID | CONVERSION_RATE |
    | ---- | ---        | ---             |
    |String of pearls |	fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80 |	0.609375 |
    |Arrow Head | 74aeb414-e3dd-4e8a-beef-0fa45225214d | 0.555556 |
    |Cactus | c17e63f7-0d28-4a95-8248-b01ea354840e | 0.545455 |
    |ZZ Plant | b66a7143-c18a-43bb-b5dc-06bb5d1d3160 | 0.539683|
    |Bamboo	|689fb64e-a4a2-45c5-b9f2-480c2155624d|	0.537313|
    |Rubber Plant|	579f4cd0-1f45-49d2-af55-9ab2b72c3b35|	0.518519|
    |Monstera|	be49171b-9f72-4fc9-bf7a-9a52e259836b|	0.510204|
    |Calathea Makoyana|	b86ae24b-6f59-47e8-8adc-b17d88cbd367	|0.509434|
    |Fiddle Leaf Fig|	e706ab70-b396-4d30-a6b2-a1ccf3625b52	|0.5|
    |Majesty Palm	|5ceddd13-cf00-481f-9285-8340ab95d06d	|0.492537|
    |Aloe Vera	|615695d3-8ffd-4850-bcf7-944cf6d3685b	|0.492308|
    |Devil's Ivy|	35550082-a52d-4301-8f06-05b30f6f3616	|0.488889|
    |Philodendron|	55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3|	0.483871|
    |Jade Plant|	a88a23ef-679c-4743-b151-dc7722040d8c|	0.478261|
    |Spider Plant|	64d39754-03e4-4fa0-b1ea-5f4293315f67|	0.474576|
    |Pilea Peperomioides|	5b50b820-1d0a-4231-9422-75e7f6b0cecf|	0.474576|
    |Dragon Tree|	37e0062f-bd15-4c3e-b272-558a86d90598|	0.467742|
    |Money Tree|	d3e228db-8ca5-42ad-bb0a-2148e876cc59|	0.464286|
    |Orchid|	c7050c3b-a898-424d-8d98-ab0aaad7bef4|	0.453333|
    |Bird of Paradise|	05df0866-1a66-41d8-9ed7-e2bbcddd6a3d|	0.45|
    |Ficus|	843b6553-dc6a-4fc4-bceb-02cd39af0168|	0.426471|
    |Birds Nest Fern|	bb19d194-e1bd-4358-819e-cd1f1b401c0c|	0.423077|
    |Pink Anthurium|	80eda933-749d-4fc6-91d5-613d29eb126f|	0.418919|
    |Boston Fern|	e2e78dfc-f25c-4fec-a002-8e280d61a2f2|	0.412698|
    |Alocasia Polly|	6f3a3072-a24d-4d11-9cef-25b0b5f8a4af|	0.411765|
    |Peace Lily	|e5ee99b6-519f-4218-8b41-62f48f59f700|	0.409091|
    |Ponytail Palm|	e18f33a6-b89a-4fbc-82ad-ccba5bb261cc|	0.4|
    |Snake Plant|	e8b6528e-a830-4d03-a027-473b411c7f02|	0.39726|
    |Angel Wings Begonia|	58b575f2-2192-4a53-9d21-df9a0c14fc25|	0.393443|
    |Pothos|	4cda01b9-62e2-46c5-830f-b7f262a58fb1|	0.344262|
    
    
    select 
        p.name,
        ds.product_id,
        count(distinct iff(ds.product_purchased, ds.session_id, null)) / count(distinct ds.session_id) as conversion_rate
    from dev_db.dbt_mrohwetter.dim_sessions ds
        left join dev_db.dbt_mrohwetter.stg_products p on ds.product_id = p.product_id
    group by 1,2
    order by 3 desc


These orders have changed to shipped:

>'8385cfcd-2b3f-443a-a676-9756f7eb5404'
>'e24985f3-2fb3-456e-a1aa-aaf88f490d70'
>'5741e351-3124-4de7-9dff-01a448e7dfd4'
