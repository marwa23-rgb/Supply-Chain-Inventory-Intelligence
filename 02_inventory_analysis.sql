USE supply_chain_db;

-- Inventory and demand analysis
SELECT SKU,
       `Product type`,
       `Stock levels`,
       `Number of products sold`,
       `Order quantities`,
       CASE
           WHEN `Number of products sold` = 0 THEN NULL
           ELSE ROUND(`Stock levels` / `Number of products sold`, 3)
       END AS stock_coverage
FROM supply_chain_data
ORDER BY stock_coverage ASC;

-- Low stock SKUs
SELECT SKU, `Product type`, `Stock levels`, `Number of products sold`
FROM supply_chain_data
WHERE `Stock levels` < 20
ORDER BY `Number of products sold` DESC;

-- Rank SKUs by sales
SELECT SKU,
       `Product type`,
       `Number of products sold`,
       RANK() OVER (ORDER BY `Number of products sold` DESC) AS sales_rank
FROM supply_chain_data;

-- Units sold share by product type
SELECT `Product type`,
       SUM(`Number of products sold`) AS total_units_sold,
       ROUND(
           100 * SUM(`Number of products sold`) /
           SUM(SUM(`Number of products sold`)) OVER (), 2
       ) AS sales_share_pct
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY total_units_sold DESC;
