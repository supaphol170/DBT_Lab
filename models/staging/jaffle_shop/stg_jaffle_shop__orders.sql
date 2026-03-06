SELECT id AS orders_id,
    USER_ID AS customers_id,
    ORDER_DATE,
    STATUS AS order_status
FROM {{ source('jaffle_shop', 'orders') }}