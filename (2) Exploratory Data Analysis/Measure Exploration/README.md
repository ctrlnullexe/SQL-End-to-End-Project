# 📊 Measure Exploration

This folder contains queries analyzing **numerical metrics** (facts) in the warehouse.

### Purpose
- Explore measures like **sales, quantity, price**.  
- Identify **nulls, inconsistencies, and unusual values**.  
- Confirm data integrity before ranking or aggregation.

### Key Insights
- Some sales records required recalculation (`sales ≠ quantity × price`).  
- Quantity and price values are mostly positive and consistent.  
- Data is ready for magnitude, ranking, and KPIs analysis.

### How to Use
1. Open `measure_overview.sql`
2. Run queries against the `gold` layer.  
3. Review comments for anomalies or patterns.

