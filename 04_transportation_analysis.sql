USE supply_chain_db;

-- Transportation mode comparison
SELECT `Transportation modes`,
       COUNT(*) AS shipments,
       ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost,
       ROUND(AVG(`Shipping times`), 2) AS avg_shipping_time,
       ROUND(AVG(`Defect rates`), 2) AS avg_defect_rate
FROM supply_chain_data
GROUP BY `Transportation modes`
ORDER BY avg_shipping_cost;

-- Carrier performance
SELECT `Shipping carriers`,
       COUNT(*) AS shipments,
       ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost,
       ROUND(AVG(`Shipping times`), 2) AS avg_shipping_time
FROM supply_chain_data
GROUP BY `Shipping carriers`;

-- Route analysis
SELECT `Routes`,
       COUNT(*) AS shipments,
       ROUND(AVG(`Costs`), 2) AS avg_total_cost,
       ROUND(AVG(`Defect rates`), 2) AS avg_defect_rate
FROM supply_chain_data
GROUP BY `Routes`
ORDER BY avg_total_cost DESC;
