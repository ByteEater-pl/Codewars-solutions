WITH curr AS (
  SELECT DISTINCT
    user_id,
    EXTRACT (YEAR FROM "date") y,
    EXTRACT (MONTH FROM "date") m
  FROM logins
)
SELECT
  (ARRAY[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ])[curr.m]
  || ', '
  || CAST (curr.y AS VARCHAR)
    "month",
  COUNT (*) retained_users
FROM curr, curr prev
WHERE
  curr.user_id = prev.user_id
  AND (curr.y - prev.y) * 12 + curr.m - prev.m = 1
GROUP BY curr.y, curr.m
ORDER BY curr.y, curr.m;
