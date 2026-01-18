/*
CUSTOMER PERFORMANCE & SEGMENTATION ANALYSIS

Purpose:
This query analyzes customer purchasing behavior by combining transactional
sales data with customer demographics to support segmentation, retention,
and revenue insights.

Highlights:
1. Gathers essential customer and transaction attributes (names, age, orders, sales).
2. Segments customers by lifecycle value (VIP, Regular, New).
3. Groups customers into age bands for demographic analysis.
4. Aggregates customer-level performance metrics:
   - total orders
   - total sales
   - total quantity purchased
   - total unique products purchased
   - customer lifespan (months active)
5. Calculates business KPIs:
   - recency (months since last order)
   - average order value (AOV)
   - average monthly spend

Output:
Customer-level metrics suitable for BI dashboards, reporting, and retention analysis.
======================================================================================
*/

WITH base_query AS (
    -- 1) Base query:
    -- Retrieves core transactional and customer attributes
    SELECT 
        f.order_number,
        f.product_key,
        f.order_date,
        f.sales_amount,
        f.quantity,
        c.customer_key,
        c.customer_number,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        DATEDIFF(YEAR, c.birthdate, GETDATE()) AS age
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON c.customer_key = f.customer_key
    WHERE f.order_date IS NOT NULL
),

customer_aggregation AS (
    -- 2) Customer aggregation:
    -- Summarizes key metrics at the customer level
    SELECT
        customer_key,
        customer_number,
        customer_name,
        age,
        COUNT(DISTINCT order_number) AS total_orders,
        SUM(sales_amount) AS total_sales,
        SUM(quantity) AS total_quantity,
        COUNT(DISTINCT product_key) AS total_products,
        MAX(order_date) AS last_order_date,
        DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
    FROM base_query
    GROUP BY
        customer_key,
        customer_number,
        customer_name,
        age
)

-- 3) Final output:
-- Applies segmentation logic and computes customer KPIs
SELECT
    customer_key,
    customer_number,
    customer_name,
    age,

    -- Age segmentation
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,

    -- Customer value segmentation
    CASE
        WHEN lifespan >= 12 AND total_sales >= 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_sales < 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment,

    total_orders,
    total_sales,
    total_quantity,
    total_products,
    lifespan,
    last_order_date,

    -- Average Order Value (AOV)
    CASE
        WHEN total_orders = 0 THEN 0
        ELSE total_sales / total_orders
    END AS avg_order_value,

    -- Average Monthly Spend
    CASE
        WHEN lifespan = 0 THEN total_sales
        ELSE total_sales / lifespan 
    END AS avg_monthly_spend

FROM customer_aggregation;
