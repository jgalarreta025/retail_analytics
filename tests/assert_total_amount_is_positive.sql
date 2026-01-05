-- tests/assert_total_amount_is_positive.sql

-- Esta query busca registros donde el total sea negativo (el error)
select
    customer_id,
    total_amount
from {{ ref('customers_with_orders') }}
where total_amount < 0