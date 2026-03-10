SELECT
  employee_id,
  COUNT (DISTINCT m) weekends_worked,
  COUNT (*) total_weekend_days_worked
FROM (
  SELECT
    a.*,
    MIN (d) OVER (PARTITION BY employee_id ORDER BY d RANGE 1 PRECEDING) m
  FROM (
    SELECT
      employee_attendance.*,
        (ARRAY[0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334])
        [EXTRACT (MONTH FROM attendance_date)]
        + EXTRACT (DAY FROM attendance_date)
      d
    FROM employee_attendance
  ) a
  WHERE
    EXTRACT (YEAR FROM attendance_date) = 2023
    AND MOD (CAST (d AS INT), 7) < 2
) b
GROUP BY employee_id
ORDER BY
  weekends_worked DESC,
  total_weekend_days_worked DESC,
  employee_id DESC;
