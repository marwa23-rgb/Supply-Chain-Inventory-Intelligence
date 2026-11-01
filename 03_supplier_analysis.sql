USE supply_chain_db;

-- Supplier performance
SELECT `Supplier name`,
       COUNT(*) AS sku_count,
       ROUND(AVG(`Defect rates`), 2) AS avg_defect_rate,
       ROUND(AVG(`Lead time`), 2) AS avg_lead_time,
       ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost
FROM supply_chain_data
GROUP BY `Supplier name`
ORDER BY avg_defect_rate DESC;

-- Supplier ranking by quality
SELECT `Supplier name`,
       ROUND(AVG(`Defect rates`), 2) AS avg_defect_rate,
       DENSE_RANK() OVER (
           ORDER BY AVG(`Defect rates`) ASC
       ) AS quality_rank
FROM supply_chain_data
GROUP BY `Supplier name`;

-- Product quality by category
SELECT `Product type`,
       ROUND(AVG(`Defect rates`), 2) AS avg_defect_rate
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY avg_defect_rate DESC;
