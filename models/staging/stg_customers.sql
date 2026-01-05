select
    id as customer_id,
    first_name,
    last_name,
    email
from {{ source('mi_tienda', 'customers') }}