SELECT categories.id category_id, category, title, views, t.id post_id
FROM
  categories LEFT JOIN (
    SELECT
      posts.*,
      ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY views DESC, id) n
    FROM posts) t
  ON categories.id = category_id
WHERE COALESCE(n, 0) < 3
ORDER BY category, views DESC, post_id
