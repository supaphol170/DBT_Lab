WITH source AS (
    SELECT *
    FROM {{ source('stripe', 'payments') }}
),
rename AS (
    SELECT ORDERID AS order_id,
        PAYMENTMETHOD,
        STATUS AS status_payment,
        AMOUNT AS payment_amount
    FROM source
    WHERE STATUS = 'success'
)
SELECT *
FROM rename