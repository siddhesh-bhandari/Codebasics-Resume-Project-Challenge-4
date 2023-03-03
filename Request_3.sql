SELECT
  segment,
  COUNT(DISTINCT product_code) AS product_count
FROM dim_product
GROUP BY segment
ORDER BY COUNT(DISTINCT product_code) DESC;