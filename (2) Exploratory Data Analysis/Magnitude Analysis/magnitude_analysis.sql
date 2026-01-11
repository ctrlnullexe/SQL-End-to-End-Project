-- 1. Total customers by country
SELECT
    country,
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;

-- Result:
-- United States: 7482
-- Australia: 3591
-- United Kingdom: 1913
-- France: 1810
-- Germany: 1780
-- Canada: 1571
-- N/A: 337

-- Insight:
# Majority of customers are from the US and Australia, but a small portion has missing country info.


-- 2. Total customers by gender
SELECT
    gender,
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;

-- Result:
-- Male: 9341
-- Female: 9128
-- N/A: 15

-- Insight:
# Balanced gender distribution; very few unknowns.


-- 3. Total products by category
SELECT
    category,
    COUNT(product_key) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC;

-- Result:
-- Components: 127
-- Bikes: 97
-- Clothing: 35
-- Accessories: 29
-- NULL: 7

-- Insight:
# Components and Bikes dominate the catalog, Accessories and Clothing smaller, some uncategorized.


-- 4. Average cost per category
SELECT
    category,
    AVG(cost) AS avg_costs
FROM gold.dim_products
GROUP BY category
ORDER BY avg_costs DESC;

-- Result:
-- Bikes: 949
-- Components: 264
-- NULL: 28
-- Clothing: 24
-- Accessories: 13

-- Insight:
# Bikes are high-value items, Components moderate, Accessories & Clothing low-cost.


-- 5. Total revenue per product category
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Result:
-- Bikes: 28,316,272
-- Accessories: 700,262
-- Clothing: 339,716

-- Insight:
# Bikes dominate revenue; Accessories and Clothing contribute much less.


-- 6. Total revenue per customer (top 10)
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;

-- Result (top 10):
-- Nichole Nara: 13,294
-- Kaitlyn Henderson: 13,294
-- Margaret He: 13,268
-- Randall Dominguez: 13,265
-- Adriana Gonzalez: 13,242
-- Rosa Hu: 13,215
-- Brandi Gill: 13,195
-- Brad She: 13,172
-- Francisco Sara: 13,164
-- Maurice Shan: 12,914

-- Insight:
# A few top customers generate disproportionately high revenue — classic long-tail distribution.


-- 7. Revenue distribution across countries
SELECT
    c.country,
    SUM(f.sales_amount) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC;

-- Result:
-- United States: 9,162,327
-- Australia: 9,060,172
-- United Kingdom: 3,391,376
-- Germany: 2,894,066
-- France: 2,643,751
-- Canada: 1,977,738
-- N/A: 226,820

-- Insight:
# US and Australia dominate sales; missing country data is minor but should be addressed.
