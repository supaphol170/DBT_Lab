WITH customers AS (
    SELECT *
    FROM {{ ref('stg_jaffle_shop__customers') }}
),
orders AS (
    SELECT *
    FROM {{ ref('stg_jaffle_shop__orders') }}
),
final AS (
    SELECT *
    FROM customers
    INNER JOIN orders ON customers.customer_id = orders.orders_id
)
SELECT *
FROM final