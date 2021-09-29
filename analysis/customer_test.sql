with customers as (
    select * from {{ ref('stg_customers')}}
),

seedCustomers as (
    select * from {{ref('selected_customers')}}
),

selected as (
    select customer_id,
    seedCustomers.customer_id is not null as is_selected,
    year_birth,
    education,
    marital_status,
    income
 from customers
 left join seedCustomers using(customer_id)
)

select * from selected
