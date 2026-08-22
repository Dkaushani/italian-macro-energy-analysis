# Italian_macro_energy_analysis

# Regional GDP Resilience to Global Energy Shocks (Italy, 2014–2024)

## Overview
This project models the economic resilience of 21 Italian regions against international Brent crude oil price fluctuations using a MySQL relational database.

## Database Structure
* **`regions`**: Master table of NUTS 2 Italian administrative regions.
* **`energy_prices`**: Annual Brent crude oil benchmark prices ($/bbl).
* **`macro_data`**: Regional annual GDP performance in Millions of Euros.

## SQL Techniques Applied
* **Relational Joins (`JOIN`):** Combined macro indicators with global commodity price benchmarks.
* **Window Functions (`LAG`):** Computed year-over-year regional GDP growth rates alongside oil price changes.
* **Conditional Aggregations (`CASE WHEN`):** Evaluated performance across high-oil ($> \$70/\text{bbl}$) and low-oil price regimes.

## Key Insights
* **High-Oil Regimes:** Evaluated regional GDP growth across 6 high-oil price years (2014, 2018, 2021–2024).
* **Economic Scale:** Identified structural growth variance between major industrial hubs (e.g., Lombardia, Veneto) and smaller regional economies.

## How to Restore Database
1. Open MySQL Workbench.
2. Go to **Server -> Data Import**.
3. Select **Import from Self-Contained File** and choose `sql/schema_and_data_dump.sql`.
4. Click **Start Import**.
