USE supply_chain_db;

-- Main project KPIs
SELECT
    COUNT(DISTINCT SKU) AS total_skus,
    SUM(`Number of products sold`) AS total_units_sold,
    ROUND(SUM(`Revenue generated`), 2) AS total_revenue,
    ROUND(AVG(`Defect rates`), 2) AS overall_avg_defect_rate,
    ROUND(AVG(`Shipping costs`), 2) AS avg_shipping_cost,
    ROUND(AVG(`Lead time`), 2) AS avg_supplier_lead_time
FROM supply_chain_data;
