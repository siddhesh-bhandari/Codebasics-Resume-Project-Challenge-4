WITH mfg_cost AS
  (SELECT d.product,
          d.product_code,
          f.manufacturing_cost
   FROM dim_product d
   INNER JOIN fact_manufacturing_cost f ON d.product_code = f.product_code)
   
SELECT DISTINCT product_code,
                product,
                manufacturing_cost
FROM mfg_cost
WHERE manufacturing_cost =
    (SELECT MAX(manufacturing_cost)
     FROM mfg_cost)
UNION
SELECT DISTINCT product_code,
                product,
                manufacturing_cost
FROM mfg_cost
WHERE manufacturing_cost =
    (SELECT MIN(manufacturing_cost)
     FROM mfg_cost)
