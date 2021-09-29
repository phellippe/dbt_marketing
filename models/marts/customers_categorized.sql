{%- set educations = ['Graduation', 'PhD', '2n Cycle', 'Master','Basic'] -%}

with customers as (
    select * from {{ ref('stg_customers')}}
),

categorized as (
    select {{ dbt_utils.surrogate_key(['customer_id'])}} as id,
     customer_id,
    {% for education in educations %}
    (case when education = '{{education}}' then {{income_cents('income')}} else 0 end) as "Income_by_{{education}}"
    {%- if not loop.last-%}
    ,
    {% endif -%}
    {%- endfor %}
    from customers
)

select * from categorized