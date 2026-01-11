-- 1. Explore all countries customers came from

  
SELECT DISTINCT country 
FROM gold.dim_customers;



-- Result (examples):
-- N/A, Germany, United States, Australia, United Kingdom, Canada, France

-- Insight:
# Customers come from multiple countries, but some records are missing country info (N/A).
# Helps identify whether geography-based segmentation is possible.


  
-- 2. Explore product categories and subcategories

  
SELECT DISTINCT category, subcategory, product_name 
FROM gold.dim_products
ORDER BY 1,2,3;



-- Result:
-- Too many rows to type here (dozens of products across multiple categories and subcategories)
-- Example:
  --categories: Accesories, Bikes, Clothing...
  --subcategories: Mountain Bikes, Road Bikes, Touring Bikes, Gloves...
  --product_name: HL Mountain Pedal, Bike Wash - Dissolver, Hitch Rack -4-Bike...

-- Insight:
# Products are divided into clear categories and subcategories.
# This informs grouping, aggregation, and drill-down analysis in dashboards.
