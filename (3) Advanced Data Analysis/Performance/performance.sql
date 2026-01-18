/*
=============================================================================================
Performance Advanced Analysis: Yearly Product Sales
=============================================================================================
Purpose:
  - Analyze how each product performs year-over-year (YoY) and compared to its own average.
  - Identify trends: products selling above or below average, and whether sales are increasing or decreasing annually.

What it does:
  1. Calculates total sales per product for each year.
  2. Compares current year sales to the product's overall average:
     - 'Above Avg', 'Below Avg', or 'Avg'.
  3. Compares current year sales to previous year's sales (YoY):
     - 'Increase', 'Decrease', or 'No Change'.
  4. Helps highlight high-performing products and potential concerns for business decisions.

Why it matters:
  - Shows you can not only query data but **extract actionable insights**.
  - Demonstrates ability to use **window functions** and advanced SQL for analytical purposes.
  - Useful for management reporting, product strategy, and forecasting.

Usage:
  - Run after populating the Gold layer.
  - Can be filtered for specific products, categories, or years for deeper insights.

=============================================================================================
*/
WITH yearly_product_sales AS (
SELECT
YEAR(f.order_date) AS order_year,
p.product_name,
SUM(f.sales_amount) AS current_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY
YEAR(f.order_date),
p.product_name
)
SELECT
order_year,
product_name,
current_sales,
AVG(current_sales) OVER (PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
	 WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
	 ELSE 'Avg'
END avg_change,

--YoY Analysis
LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) py_sales,
current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
CASE WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
	 WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
	 ELSE 'No Change'
END py_change
FROM yearly_product_sales
ORDER BY product_name, order_year
