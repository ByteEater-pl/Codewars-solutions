WITH RECURSIVE t(i, a, b) AS (
  VALUES (0, CAST(1 AS BIGINT), CAST(0 AS BIGINT))
  UNION
  SELECT i + 1, b, a + b
  FROM t
  WHERE i < 89
)
SELECT b number FROM t
