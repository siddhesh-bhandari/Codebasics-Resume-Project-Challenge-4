With quarter_sales as (
  select 
    month(date), 
    fiscal_year, 
    sold_quantity, 
    quarter(date) as Qtr, 
    case when month(date) in (9, 10, 11) Then '1' when month(date) in (12, 1, 2) Then '2' when month(date) in (3, 4, 5) Then '3' when month(date) in (6, 7, 8) Then '4' else null end as quarter_number 
  FROM 
    fact_sales_monthly 
  where 
    fiscal_year = 2020
) 
Select 
  quarter_number, 
  sum(sold_quantity) as sold_quantity
from 
  quarter_sales 
group by 
  quarter_number 
order by 
  quarter_number asc
