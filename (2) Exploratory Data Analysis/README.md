# Exploratory Data Analysis (Phase 2)

**Diggin into the gold layer.**

This part of the project shows how to explore a data warehouse from multiple angles: dates, dimensions, measures, magnitude, and rankings. The goal isn’t just to run queries. iIt’s to understand what the data is telling you.

---

## Structure

The folder is organized by type of analysis:

Exploratory Data Analysis/

├── Date Exploration/

├── Dimensions Exploration/

├── Magnitude Analysis/

├── Measure Exploration/

└── Ranking Analysis/
\---


Each folder contains SQL queries and notes for that type of analysis. Some queries are short. The focus is insights, not volume.

---

## How it works

1. **Date Exploration** → Understand time ranges, oldest/newest customers, and age distributions.  
2. **Dimensions Exploration** → Explore categorical fields like country, product category, or customer gender.  
3. **Magnitude Analysis** → Count totals, sums, and averages for key dimensions and measures.  
4. **Measure Exploration** → Understand sales, quantity, price, and other numeric metrics.  
5. **Ranking Analysis** → Identify top/bottom performers for products and customers.  

---

## What Each Section Shows

| Section                 | Purpose                                                                                   | Example Insights                        |
|-------------------------|-------------------------------------------------------------------------------------------|----------------------------------------|
| Date Exploration         | Analyze order dates and customer ages                                                    | Oldest customer: 110 years, Sales range: 2010–2014 |
| Dimensions Exploration   | Check unique values in categorical fields                                               | Customers from 7 countries, Product categories |
| Magnitude Analysis       | Summarize totals, counts, averages                                                      | 18,484 customers, $29,356,250 total sales |
| Measure Exploration      | Deep dive into numeric measures                                                          | Avg price = $486, total quantity sold = 60,423 |
| Ranking Analysis         | Rank customers/products by revenue, orders, or other KPIs                                | Top 5 products generate $7M+, bottom 3 customers have 1 order |

---

## Why This Matters

- Shows full understanding of the data warehouse.  
- You can trace dimensions and measures to see how they interact.  
- Highlights top performers and potential issues before analytics or dashboards.  
- Proves you can not just build a warehouse, but use it to generate business insights.  

---

## How to Use

1. Clone repo.  
2. Make sure the **gold layer** is loaded and available (`dim_customers`, `dim_products`, `fact_sales` views).  
3. Open each folder, run the SQL queries, and explore the results.  
4. Use the insights to build reports, dashboards, or do whatever you wish.  

---
