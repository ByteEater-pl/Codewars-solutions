WITH RECURSIVE cal (w) AS (
  VALUES (1)
  UNION
  SELECT w + 1
  FROM cal
  WHERE w < 52
)
SELECT
    'Week '
    || CAST (w AS VARCHAR)
    || ' ('
    || SUBSTRING (CAST (mon AS VARCHAR) FROM 1 FOR 10)
    || ' - '
    || SUBSTRING (CAST (sun AS VARCHAR) FROM 1 FOR 10)
    || ')'
  week,
  COUNT (*) FILTER (WHERE delta = 1) opened,
  COUNT (*) FILTER (WHERE delta = -1) closed,
  SUM (CAST (SUM (delta) AS INT)) OVER (ORDER BY w) active
FROM
  cal,
  LATERAL (VALUES (INTERVAL '7' DAY * w)) a (d),
  LATERAL
    (
      VALUES (
        DATE '2023-12-25' + d,
        DATE '2023-12-31' + d
      )
    ) b (mon, sun)
    LEFT JOIN (
      SELECT
        ticket_id,
        start_date change_date,
        1 delta
      FROM ticket_status
      UNION
      SELECT
        ticket_id,
        finish_date change_date,
        -1 delta
      FROM ticket_status
    ) c
    ON change_date BETWEEN mon AND sun
GROUP BY w, mon, sun
ORDER BY w;
