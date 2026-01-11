-- 1. Date of the first and last order
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM gold.fact_sales;

-- Result:
-- first_order_date: 2010-12-29
-- last_order_date: 2014-01-28

-- Insight:
# Sales data spans just over 4 years, giving enough history to analyze trends, seasonality, and growth.

  
-- 2. How many years of sales are available
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales;

-- Result:
-- order_range_years: 4

-- Insight:
# Confirms 4 full years of data, which is perfect for year-over-year comparisons or growth analysis.


  -- 3. Youngest and oldest customer by birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    MAX(birthdate) AS youngest_birthdate
FROM gold.dim_customers;

-- Result:
-- oldest_birthdate: 1916-02-10
-- youngest_birthdate: 1986-06-25

-- Insight:
# Customer ages range from 40 to 110 years old, showing a wide demographic spread.


  -- 4. Oldest and youngest age in years
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate
FROM gold.dim_customers;

-- Result:
-- oldest_age: 110
-- youngest_birthdate: 1986-06-25

SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age,
    MAX(birthdate) AS youngest_birthdate;

-- Result:
-- youngest_age: 40

-- Insight:
# The dataset captures customers across multiple generations — good for segmentation and age-based analysis.

