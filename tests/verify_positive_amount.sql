-- data test

select
    customer_id,
    sum(income) as total_income
from {{ ref('stg_customers')}}
group by 1
having not(total_income >= 0)