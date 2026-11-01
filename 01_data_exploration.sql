CREATE DATABASE IF NOT EXISTS supply_chain_db;
USE supply_chain_db;

-- After importing the CSV into a table named supply_chain_data:
SELECT * FROM supply_chain_data LIMIT 10;

SELECT COUNT(*) AS total_records,
       COUNT(DISTINCT SKU) AS unique_skus
FROM supply_chain_data;

SELECT `Product type`, COUNT(*) AS sku_count
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY sku_count DESC;

SELECT `Inspection results`, COUNT(*) AS records
FROM supply_chain_data
GROUP BY `Inspection results`;

SELECT `Transportation modes`, COUNT(*) AS records
FROM supply_chain_data
GROUP BY `Transportation modes`;
