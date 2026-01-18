# SQL-End-to-End-Project

From messy CSVs to insights you can actually use.

This project shows how I take raw data, clean it, and turn it into something you can analyze. Not just queries — it’s understanding how data moves and what it’s telling you.

---

What’s in the Project

Data Warehouse (Phase 1) – organize raw data into Bronze → Silver → Gold so it’s clean and ready.

Exploratory Data Analysis (Phase 2) – poke around the data: dates, categories, counts, totals, rankings.

Advanced Data Analysis (Phase 3) – deeper look: trends, cumulative totals, segments, performance over time.

---

How the Folders Work

SQL-End-to-End-Project/
├── Data Warehouse/
│   ├── Bronze/       # Raw messy CSVs
│   ├── Silver/       # Cleaned and standardized
│   └── Gold/         # Star schema for analysis
├── Exploratory Data Analysis/
│   ├── Date Exploration/
│   ├── Dimensions Exploration/
│   ├── Magnitude Analysis/
│   ├── Measure Exploration/
│   └── Ranking Analysis/
└── Advanced Data Analysis/
    ├── Change Over Time/
    ├── Cumulative Analysis/
    ├── Customers Report/
    ├── Data Segmentation/
    ├── Part-to-Whole/
    ├── Performance Analysis/
    └── Products Report/
Every folder has SQL queries and results. Some queries are short. My point isn’t to write a ton of code. It’s to show insights.

---

What Each Phase Does
Phase 1 – Data Warehouse

Bronze: Keep the raw data safe.

Silver: Clean it, fix dates, remove duplicates.

Gold: Star schema for easy analytics.

Phase 2 – Exploratory Data Analysis

Look at time, categories, totals, averages, and rankings.

Understand who the customers are, what products sell most, and how revenue spreads.

Phase 3 – Advanced Analysis

Track changes over time (monthly/yearly trends).

Calculate cumulative totals and moving averages.

Build customer and product reports.

Segment data (cost ranges, VIP vs. new customers).

Compare performance against averages and previous years.

---

##Quick Highlights

Section	Example Insights
Dates	Sales from 2010–2014, oldest customer 110 yrs
Dimensions	Customers from 7 countries, 5 product categories
Magnitude	18,484 customers, $29M sales
Measures	Avg price $486, total quantity sold 60,423
Rankings	Top 5 products make $7M+, bottom 3 customers 1 order each
Change Over Time	Jun 2011: 230 customers, $737k sales
Cumulative	Total sales grow from $43k → $29.3M
Customers Report	Jon Yang (VIP, 50+) → 3 orders, $8,249; Chloe Young (New) → 3 orders, $2,501
Segmentation	Product cost: Below 100 → 110, Above 1000 → 39
Customers: New 14,631, VIP 1,655
Part-to-Whole	Bikes 96%, Accessories 2%, Clothing 1%
Performance	All-Purpose Bike Stand: 2012 ($159) → 2013 ($37k) → 2014 ($1,749)
