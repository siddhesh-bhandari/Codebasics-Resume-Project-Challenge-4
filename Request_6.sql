SELECT d.customer_code,
       d.customer,
       ROUND((f.pre_invoice_discount_pct), 4) * 100 AS average_discount_percentage
FROM dim_customer d
INNER JOIN fact_pre_invoice_deductions f ON d.customer_code = f.customer_code
WHERE d.market = 'India'
  AND f.fiscal_year = '2021'
GROUP BY d.customer_code,
         d.customer
ORDER BY f.pre_invoice_discount_pct DESC
LIMIT 5;