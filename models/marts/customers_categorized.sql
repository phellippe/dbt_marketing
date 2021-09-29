{%- set educations = ['Graduation', 'PhD', '2n Cycle', 'Master','Basic'] -%}

with customers as (
    select * from {{ ref('stg_customers')}}
),

categorized as (
    select customer_id,
    {% for education in educations %}
    (case when education = '{{education}}' then {{income_cents('income',2)}} else 0 end) as "Income_by_{{education}}"
    {%- if not loop.last-%}
    ,
    {% endif -%}
    {%- endfor %}
    from customers
)

select * from categorized