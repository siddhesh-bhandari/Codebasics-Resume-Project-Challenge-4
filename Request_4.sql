WITH segments_table AS
  (SELECT d.segment,
          f.fiscal_year,
          COUNT(DISTINCT d.product_code) AS product_count
   FROM dim_product d
   INNER JOIN fact_sales_monthly f ON d.product_code = f.product_code
   GROUP BY d.segment,
            f.fiscal_year)
            
SELECT a.segment,
       a.product_count AS product_count_2020,
       b.product_count AS product_count_2021,
       (b.product_count - a.product_count) AS difference
FROM segments_table a
INNER JOIN segments_table b ON a.segment = b.segment
WHERE a.fiscal_year = '2020'
  AND b.fiscal_year = '2021';
 

