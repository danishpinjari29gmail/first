
with sales as (
    SELECT 
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price', 'quantity') }} as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM {{ ref('bronze_fact_sales') }}
),
products as (
    SELECT 
        product_sk,
        category
    FROM {{ ref('bronze_dim_product') }}
),
customer as (
    SELECT 
        customer_sk,
        gender
    FROM {{ ref('bronze_dim_customer') }}
),
joined_query as (
SELECT 
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    products.category,
    customer.gender
FROM 
    sales
JOIN 
    products
        ON sales.product_sk = products.product_sk
JOIN 
    customer
        ON sales.customer_sk = customer.customer_sk
)

SELECT category,
       gender,
       SUM(gross_amount) AS total_sales
    FROM joined_query
    GROUP BY category, gender
    ORDER BY total_sales DESC