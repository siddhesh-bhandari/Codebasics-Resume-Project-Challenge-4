With channel_sales as (
  select 
    dc.channel, 
    Round(
      Sum(
        fs.sold_quantity * fg.gross_price
      )/ 1000000, 
      2
    ) as gross_sales_mln 
  FROM 
    fact_sales_monthly fs 
    inner join fact_gross_price fg 
    inner join dim_customer dc on dc.customer_code = fs.customer_code 
    and fg.product_code = fs.product_code 
    and fg.fiscal_year = fs.fiscal_year 
  where 
    fs.fiscal_year = 2021 
  group by 
    dc.channel
) 
select 
  channel, 
  gross_sales_mln, 
  gross_sales_mln /(
    Select 
      sum(gross_sales_mln) as total_gross_sales 
    from 
      channel_sales
  )* 100 as percentage 
from 
  channel_sales
order by gross_sales_mln desc
