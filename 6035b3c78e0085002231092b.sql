SELECT
  SUM (SUM (amount)) OVER (ORDER BY "date") balance,
  "date"
FROM (
  SELECT
    amount,
    CAST ("date" AS DATE) "date"
  FROM operations
) a
GROUP BY "date";
