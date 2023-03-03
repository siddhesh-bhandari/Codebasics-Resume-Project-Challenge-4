WITH uni_prd
AS (SELECT
  f.fiscal_year,
  COUNT(DISTINCT d.product_code) AS unique_products
FROM fact_sales_monthly f
INNER JOIN dim_product d
  ON d.product_code = f.product_code
GROUP BY f.fiscal_year)

SELECT
  u1.unique_products AS unique_products_2020,
  u2.unique_products AS unique_products_2022,
  (u2.unique_products - u1.unique_products) / (u1.unique_products) * 100 AS percentage_chg
FROM uni_prd u1
CROSS JOIN uni_prd u2
WHERE u1.fiscal_year = 2020
AND u2.fiscal_year = 2021




