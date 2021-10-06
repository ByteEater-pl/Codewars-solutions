SELECT
  w date,
  c count,
  CAST(SUM(c) OVER (ORDER BY w) AS INTEGER) total
FROM (
  SELECT
    CAST(
      SUBSTRING('000' || y FROM CHAR_LENGTH(y)) || '-'
      || SUBSTRING('0' || m FROM CHAR_LENGTH(m)) || '-'
      || SUBSTRING('0' || d FROM CHAR_LENGTH(d)) AS DATE) w,
    COUNT(*) c
  FROM (
    SELECT
      CAST(EXTRACT(YEAR FROM created_at) AS VARCHAR(4)) y,
      CAST(EXTRACT(MONTH FROM created_at) AS VARCHAR(2)) m,
      CAST(EXTRACT(DAY FROM created_at) AS VARCHAR(2)) d
    FROM posts) u
  GROUP BY y, m, d) v
ORDER BY date
