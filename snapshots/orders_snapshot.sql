{% snapshot orders_snapshot %}

{{
    config(
      target_database='test',
      target_schema='snapshots',
      unique_key='id',
      
      strategy='check',
      check_cols=['status', 'amount']
    )
}}

select * from {{ source('mi_tienda', 'orders') }}

{% endsnapshot %}