select
    order_id,
    amount as precio_neto,
    
    -- Aquí llamamos a nuestra macro mágica
    -- Caso 1: Usar el 21% por defecto
    {{ calcular_impuesto('amount') }} as precio_con_iva_general,
    
    -- Caso 2: Usar un impuesto específico (ej. 10% para alimentos)
    {{ calcular_impuesto('amount', 0.10) }} as precio_con_iva_reducido

from {{ ref('stg_orders') }}