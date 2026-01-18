/*
======================================================================================
Product Cost Segmentation
--------------------------------------------------------------------------------------
Purpose:
Segment products into cost ranges and count the number of products in each segment.
This helps identify which price brackets contain the most products, 
useful for inventory planning and pricing strategies.

Cost Ranges:
- Below 100
- 100-500
- 500-1000
- Above 1000
======================================================================================
*/
WITH product_segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold.dim_products
)
SELECT
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;



/*
======================================================================================
Customer Spending Segmentation
--------------------------------------------------------------------------------------
Purpose:
Group customers into 3 segments based on spending patterns and lifespan:
1. VIP: at least 12 months & total spending > $5000
2. Regular: at least 12 months & total spending <= $5000
3. New: lifespan < 12 months

Metrics Calculated:
- total_spending: total sales per customer
- first_order: date of first order
- last_order: date of last order
- lifespan: months between first and last order
- total_customers: number of customers in each segment
======================================================================================
*/
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT
        customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) t
GROUP BY customer_segment
ORDER BY total_customers DESC;
