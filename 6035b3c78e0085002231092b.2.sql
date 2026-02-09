SELECT
  SUM (SUM (amount)) OVER (ORDER BY d) balance,
  d "date"
FROM
  operations, 
  LATERAL (SELECT CAST ("date" AS DATE) d FROM (VALUES (0)) a) b
GROUP BY d;
