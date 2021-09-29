select id as customer_id,
    year_birth,
    education,
    marital_status,
    income
 from {{ source('mkt','customers')}}