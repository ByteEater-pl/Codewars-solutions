SELECT
  SUM (SUM (amount)) OVER (ORDER BY d) balance,
  d "date"
FROM
  operations, 
  LATERAL (SELECT CAST ("date" AS DATE) d) a
GROUP BY d;
