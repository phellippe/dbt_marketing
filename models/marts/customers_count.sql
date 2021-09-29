with customers as (
    select * from {{ ref('stg_customers')}}
),

sum_category as (
    select education,
    count (*) as customers_By_Education
    from customers
    group by education
)

select * from sum_category