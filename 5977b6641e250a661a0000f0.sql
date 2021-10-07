SELECT
  entry_time when_happened,
  SUM(n) OVER (ORDER BY t, n) visits_count
FROM
  visits,
  LATERAL (VALUES (entry_time, 1), (exit_time, -1)) u(t, n)
ORDER BY visits_count DESC, when_happened
FETCH NEXT ROW ONLY
