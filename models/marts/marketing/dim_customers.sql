with customers AS (
    SELECT *
    FROM {{ ref('stg_jaffle_shop__customers') }}
),
orders AS (
    SELECT *
    FROM {{ ref('fct_orders') }}
),
customers_orders AS (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        SUM(amount) AS lifetime_value
    from orders
    group by 1
),

final as (
    select
        customers.customer_id AS customer_id,
        customers.first_name AS first_name,
        customers.last_name AS last_name,
        customers_orders.first_order_date AS first_order_date,
        customers_orders.most_recent_order_date AS most_recent_order_date,
        coalesce (customers_orders.number_of_orders, 0) AS number_of_orders,
        lifetime_value
    from customers
    left join customers_orders using (customer_id)
)

select (SUM(lifetime_value)/100)::INT AS lifetime_value
from final