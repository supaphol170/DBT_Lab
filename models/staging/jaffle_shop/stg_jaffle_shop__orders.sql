SELECT id AS orders_id,
    USER_ID AS customer_id,
    ORDER_DATE AS order_date,
    STATUS AS order_status
FROM {{ source('jaffle_shop', 'orders') }}