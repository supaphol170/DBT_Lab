SELECT ID AS customer_id,
    ORDERID AS order_id,
    PAYMENTMETHOD AS payment_method,
    STATUS AS payment_status,
    (AMOUNT/100)::INT AS payment_amount,
    CREATED AS created
FROM {{ source('stripe', 'payments') }}
WHERE STATUS = "success"