SELECT
  RANK() OVER (ORDER BY SUM(points) DESC) rank,
  COALESCE(NULLIF(clan, ''), '[no clan specified]') clan,
  SUM(points) total_points,
  COUNT(*) total_people
FROM people
GROUP BY clan
