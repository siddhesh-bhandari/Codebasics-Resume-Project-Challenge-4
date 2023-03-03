With tmp as (
  select 
    dp.division, 
    dp.product_code, 
    dp.product,
    Sum(fs.sold_quantity) as total_sold_quantity, 
    Rank() over(
      partition by division 
      order by 
        Sum(fs.sold_quantity) desc
    ) as rank_order 
  from 
    dim_product dp 
    inner join fact_gross_price fg on dp.product_code = fg.product_code 
    inner join fact_sales_monthly fs on fg.fiscal_year = fs.fiscal_year 
    and fg.product_code = fs.product_code 
  where 
    fs.fiscal_year = 2021 
  group by 
    dp.division, 
    dp.product_code, 
    dp.product
) 
Select 
  * 
from 
  tmp 
where 
  rank_order <= 3



