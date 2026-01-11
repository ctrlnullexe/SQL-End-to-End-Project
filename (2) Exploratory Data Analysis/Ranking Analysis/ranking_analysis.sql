-- 1. Top 5 products by revenue
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Result:
-- Mountain-200 Black- 46     1,373,454
-- Mountain-200 Black- 42     1,363,128
-- Mountain-200 Silver- 38    1,339,394
-- Mountain-200 Silver- 46    1,301,029
-- Mountain-200 Black- 38     1,294,854

-- Insight:
# These are the cash cow products generating the majority of revenue.


-- 2. Bottom 5 products by revenue
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Result:
-- (Lowest-selling products; similar format as above)
-- Insight:
# Highlights slow movers. Could be candidates for discounting, bundling, or discontinuation.


-- 3. Top 10 customers by total revenue
SELECT TOP 10
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

-- Result:
-- 1302  Nichole   Nara         13,294
-- 1133  Kaitlyn   Henderson    13,294
-- 1309  Margaret  He           13,268
-- 1132  Randall   Dominguez    13,265
-- 1301  Adriana   Gonzalez     13,242
-- 1322  Rosa      Hu           13,215
-- 1125  Brandi    Gill         13,195
-- 1308  Brad      She          13,172
-- 1297  Francisco Sara         13,164
-- 434   Maurice   Shan         12,914

-- Insight:
# These are your most valuable customers. Great for loyalty programs or targeted offers.


-- 4. Bottom 3 customers by number of orders placed
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders;

-- Result:
-- 16  Chloe   Young     1
-- 17  Wyatt   Hill      1
-- 21  Jordan  King      1

-- Insight:
# These customers are almost inactive. Could be targeted for re-engagement campaigns.
