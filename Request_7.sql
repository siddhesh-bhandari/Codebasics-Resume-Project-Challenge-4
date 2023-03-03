SELECT MONTH(date) AS Month,
       YEAR(date) AS Year,
       Sum(fs.sold_quantity * fg.gross_price) AS Gross sales Amount
FROM fact_sales_monthly fs
INNER JOIN fact_gross_price fg
INNER JOIN dim_customer dc ON fg.product_code = fs.product_code
AND fg.fiscal_year = fs.fiscal_year
AND fs.customer_code = dc.customer_code
WHERE dc.customer = 'Atliq Exclusive'
GROUP BY MONTH(date),
         YEAR(date)
ORDER BY YEAR(date) ASC