-- 1. Total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- Result: 29,356,250
-- Insight: Total revenue for the period. Gives a high level view of business size.



-- 2. Total items sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales;

-- Result: 60,423
-- Insight: Volume of products sold across all orders.


-- 3. Average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

-- Result: 486
-- Insight: Shows typical unit price, can help identify high/low value items.


-- 4. Total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

-- Result: 60,398 total rows, 27,659 distinct orders
-- Insight: Many orders have multiple line items distinct orders = actual transactions.


-- 5. Total number of products
SELECT COUNT(product_name) AS total_products FROM gold.dim_products;
SELECT COUNT(DISTINCT product_name) AS total_products FROM gold.dim_products;

-- Result: 295
-- Insight: Catalog size, each product is uniquely identifiable.


-- 6. Total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers;

-- Result: 18,484
-- Insight: Overall customer base.


-- 7. Total number of customers that placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales;

-- Result: 19,494
-- Insight: Slightly higher than customer table which indicates duplicate/missing keys or guest orders.


-- 8. Key Metrics Report (all-in-one)
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Num Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Num Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Num Customers', COUNT(customer_key) FROM gold.dim_customers;

-- Result:
-- measure_name          measure_value
-- Total Sales           29,356,250
-- Total Quantity        60,423
-- Average Price         486
-- Total Num Orders      27,659
-- Total Num Products    295
-- Total Num Customers   18,484

-- Insight:
# Quick executive level summary; all key business metrics in one place.
