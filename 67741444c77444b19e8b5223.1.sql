SELECT product_id
FROM product_tags
WHERE tag IN ('Electronics', 'Gadgets')
GROUP BY product_id
HAVING COUNT (DISTINCT tag) = 2
ORDER BY product_id DESC;
