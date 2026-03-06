WITH customers AS (
    SELECT *
    FROM {{ ref('stg_jaffle_shop__customers') }}
),
orders AS (
    SELECT customer_id,
        COUNT(orders_id) AS number_of_orders,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date
    FROM {{ ref('stg_jaffle_shop__orders') }}
    GROUP BY 1
),
final AS (
    SELECT customer_id,
        first_name,
        last_name,
        COALESCE(number_of_orders, 0) AS number_of_orders,
        COALESCE(first_order_date, '1900-01-01') AS first_order_date,
        COALESCE(most_recent_order_date, '1900-01-01') AS most_recent_order_date
    FROM customers
    LEFT JOIN orders USING (customer_id)
)
SELECT *
FROM final
ORDER BY customer_id