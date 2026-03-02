SELECT id AS orders_id,
    USER_ID,
    ORDER_DATE,
    STATUS
FROM {{ source('jaffle_shop', 'orders') }}