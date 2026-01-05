{{
    config(
        materialized='incremental',
        unique_key='order_id' 
    )
}}

select
    id as order_id,
    user_id,
    order_date,
    status,
    amount,
    now() as dbt_updated_at -- Marca de tiempo de cuándo procesamos esto

from {{ source('mi_tienda', 'orders') }}

-- La magia ocurre aquí:
{% if is_incremental() %}

  -- Si la tabla ya existe (es una ejecución incremental),
  -- solo carga filas cuya fecha sea POSTERIOR a la última fecha que tenemos guardada.
  where order_date > (select max(order_date) from {{ this }})

{% endif %}