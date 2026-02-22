SELECT
  film_id,
  title || ' (' || rating || ')'
    film_title,
  rental_count,
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
  ])[EXTRACT (MONTH FROM d)]
  || CASE
      WHEN EXTRACT (DAY FROM d) > 9 THEN ' '
      ELSE ' 0'
    END
  || CAST (EXTRACT (DAY FROM d) AS VARCHAR)
  || ', '
  || CAST (EXTRACT (YEAR FROM d) AS VARCHAR)
    last_rental_date
FROM (
  SELECT
    film.*,
    COUNT (*) rental_count,
    MAX (rental_date) d
  FROM film NATURAL JOIN inventory NATURAL JOIN rental
  GROUP BY film_id
) a
WHERE
  d < CURRENT_DATE - INTERVAL '1' MONTH
  AND rental_count > 9
ORDER BY
  rental_count DESC,
  last_rental_date DESC,
  title;
