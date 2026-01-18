/*
======================================================================================
Change Over Time Analysis
--------------------------------------------------------------------------------------
Purpose:
Analyze sales performance trends over time to understand growth, seasonality,
and customer activity patterns.

This script provides two time-based aggregations:
1. Year & Month breakdown – useful for high-level yearly and monthly trends.
2. Monthly date-truncated breakdown – useful for time series analysis and dashboards.

Metrics Calculated:
- total_sales: total revenue generated
- total_customers: number of distinct customers
- total_quantity: total units sold
======================================================================================
*/

-- 1) Change over time by year and month
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    YEAR(order_date),
    MONTH(order_date);


-- 2) Change over time using monthly date truncation
SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY
    DATETRUNC(month, order_date)
ORDER BY
    DATETRUNC(month, order_date);
