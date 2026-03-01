SELECT product_id
FROM product_tags
GROUP BY product_id
HAVING
  COUNT (DISTINCT tag)
  FILTER (WHERE tag IN ('Electronics', 'Gadgets'))
  = 2
ORDER BY product_id DESC;
