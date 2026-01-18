/*
======================================================================================
Running Total & Moving Average Analysis
--------------------------------------------------------------------------------------
Purpose:
Analyze sales trends over time by calculating:
1. Total sales per year
2. Running total of sales
3. Moving average of sales to smooth long-term trends

This query uses window functions to track cumulative performance
and trend direction across time.

Metrics Calculated:
- total_sales: total revenue per year
- running_total_sales: cumulative sales over time
- moving_average_price: moving average of total sales
======================================================================================
*/

-- Calculate total sales per year and running totals over time
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(total_sales) OVER (ORDER BY order_date) AS moving_average_price
FROM (
    SELECT
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t
ORDER BY order_date;
