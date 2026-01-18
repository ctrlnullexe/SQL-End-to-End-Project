/*
======================================================================================
Category Sales Contribution
--------------------------------------------------------------------------------------
Purpose:
Identify which product categories contribute most to overall sales.
This helps highlight key revenue-driving categories and supports strategic decisions 
for inventory, marketing, and promotions.

Metrics Calculated:
- total_sales: total sales per category
- overall_sales: total sales across all categories
- percentage_of_total: contribution of each category to overall sales
======================================================================================
*/
WITH category_sales AS (
    -- Step 1: Aggregate sales by category
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON f.product_key = p.product_key
    GROUP BY p.category
)
-- Step 2: Calculate contribution to total sales
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    CONCAT(
        ROUND(
            (CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2
        ), '%'
    ) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

