USE macro_analysis;

-- Query 1: Verify data loaded correctly across all tables
SELECT 'regions' AS dataset, COUNT(*) AS total_rows FROM regions
UNION ALL
SELECT 'energy_prices', COUNT(*) FROM energy_prices
UNION ALL
SELECT 'macro_data', COUNT(*) FROM macro_data;
-- Query 2: Identify high oil price regimes (> $70/barrel)
SELECT year, crude_oil_price 
FROM energy_prices 
WHERE crude_oil_price > 70.00
ORDER BY crude_oil_price DESC;

-- Query 3: Join regional GDP data with international oil prices
SELECT 
    m.region_name,
    m.year,
    e.crude_oil_price,
    m.gdp_value
FROM macro_data m
JOIN energy_prices e ON m.year = e.year
ORDER BY m.region_name, m.year;


USE macro_analysis;

-- Check for duplicate years in energy_prices
SELECT year, COUNT(*) 
FROM energy_prices 
GROUP BY year 
HAVING COUNT(*) > 1;

-- Check for duplicate region/year combinations in macro_data
SELECT region_name, year, COUNT(*) 
FROM macro_data 
GROUP BY region_name, year 
HAVING COUNT(*) > 1;



USE macro_analysis;

DELETE t1 FROM macro_data t1
INNER JOIN macro_data t2 
WHERE t1.data_id > t2.data_id 
  AND t1.region_name = t2.region_name 
  AND t1.year = t2.year;
  
  
  SELECT region_name, year, COUNT(*) 
FROM macro_data 
GROUP BY region_name, year 
HAVING COUNT(*) > 1;


SELECT 
    m.region_name,
    m.year,
    e.crude_oil_price,
    m.gdp_value
FROM macro_data m
JOIN energy_prices e ON m.year = e.year
ORDER BY m.region_name, m.year;

USE macro_analysis;

-- 1. Temporarily disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- 2. Delete duplicate rows keeping only one entry per region and year
DELETE t1 FROM macro_data t1
INNER JOIN macro_data t2 
WHERE t1.data_id > t2.data_id 
  AND t1.region_name = t2.region_name 
  AND t1.year = t2.year;

-- 3. Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1

SELECT 
    m.region_name,
    m.year,
    e.crude_oil_price,
    m.gdp_value
FROM macro_data m
JOIN energy_prices e ON m.year = e.year
ORDER BY m.region_name, m.year;

USE macro_analysis;

-- Query 4: Average GDP during high oil price periods per region
SELECT 
    m.region_name,
    ROUND(AVG(m.gdp_value), 2) AS avg_gdp_high_oil_period,
    COUNT(m.year) AS total_years
FROM macro_data m
JOIN energy_prices e ON m.year = e.year
WHERE e.crude_oil_price > 70.00
GROUP BY m.region_name
ORDER BY avg_gdp_high_oil_period DESC;

USE macro_analysis;

CREATE OR REPLACE VIEW vw_regional_oil_growth AS
WITH lagged_data AS (
    SELECT 
        m.region_name,
        m.year,
        m.gdp_value,
        e.crude_oil_price,
        LAG(m.gdp_value, 1) OVER (PARTITION BY m.region_name ORDER BY m.year) AS prev_gdp,
        LAG(e.crude_oil_price, 1) OVER (PARTITION BY m.region_name ORDER BY m.year) AS prev_oil_price
    FROM macro_data m
    JOIN energy_prices e ON m.year = e.year
)
SELECT 
    region_name,
    year,
    gdp_value,
    crude_oil_price,
    ROUND(((gdp_value - prev_gdp) / prev_gdp) * 100, 2) AS gdp_growth_pct,
    ROUND(((crude_oil_price - prev_oil_price) / prev_oil_price) * 100, 2) AS oil_price_change_pct
FROM lagged_data
ORDER BY region_name, year;

-- Run the view
SELECT * FROM vw_regional_oil_growth;

USE macro_analysis;

SELECT 
    m.region_name,
    ROUND(AVG(CASE WHEN e.crude_oil_price > 70 THEN m.gdp_value END), 2) AS avg_gdp_high_oil_regime,
    ROUND(AVG(CASE WHEN e.crude_oil_price <= 70 THEN m.gdp_value END), 2) AS avg_gdp_low_oil_regime,
    ROUND(
        (AVG(CASE WHEN e.crude_oil_price > 70 THEN m.gdp_value END) - 
         AVG(CASE WHEN e.crude_oil_price <= 70 THEN m.gdp_value END)) / 
         AVG(CASE WHEN e.crude_oil_price <= 70 THEN m.gdp_value END) * 100, 2
    ) AS pct_difference
FROM macro_data m
JOIN energy_prices e ON m.year = e.year
GROUP BY m.region_name
ORDER BY pct_difference DESC;