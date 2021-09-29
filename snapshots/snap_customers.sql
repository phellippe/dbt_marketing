{% snapshot customers_snapshot %}

    {{
        config(
          target_schema='dbt_mkt_snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['marital_status'],
        )
    }}
select id ,
    year_birth,
    education,
    marital_status,
    income from {{ source('mkt', 'customers') }}

{% endsnapshot %}