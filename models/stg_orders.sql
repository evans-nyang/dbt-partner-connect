select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from crude.jaffle_shop.orders