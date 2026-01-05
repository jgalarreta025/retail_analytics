select
    -- Usamos la función del paquete para crear un hash único automático
    {{ dbt_utils.generate_surrogate_key(['id', 'user_id']) }} as order_kye,
    
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    amount

from {{ source('mi_tienda', 'orders') }}