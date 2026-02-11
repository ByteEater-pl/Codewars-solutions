SELECT
  region_id,
  sale_date,
  sales_amount,
  sales_rank_within_region,
  DENSE_RANK () OVER (ORDER BY earliest, region_id DESC) earliest_top_sale_rank
FROM (
  SELECT
    ranked.*,
      MIN (sale_date) FILTER (WHERE sales_rank_within_region = 1) OVER (PARTITION BY region_id)
    earliest
  FROM (
    SELECT
      daily_sales.*,
        RANK () OVER (PARTITION BY region_id ORDER BY sales_amount DESC, sale_date DESC)
      sales_rank_within_region
    FROM daily_sales
  ) ranked
) a
ORDER BY
  earliest_top_sale_rank,
  sales_rank_within_region;
