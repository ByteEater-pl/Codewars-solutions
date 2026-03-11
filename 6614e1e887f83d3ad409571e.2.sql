SELECT
  employee_id,
  COUNT (DISTINCT d / 7) weekends_worked,
  COUNT (*) total_weekend_days_worked
FROM
  employee_attendance,
  LATERAL (VALUES (
    (ARRAY[1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335])
      [EXTRACT (MONTH FROM attendance_date)]
      + CAST (EXTRACT (DAY FROM attendance_date) AS INT))
  ) a (d)
WHERE
  EXTRACT (YEAR FROM attendance_date) = 2023
  AND MOD (d - 1, 7) < 2
GROUP BY employee_id
ORDER BY
  weekends_worked DESC,
  total_weekend_days_worked DESC,
  employee_id DESC;
