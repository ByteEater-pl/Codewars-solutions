SELECT
  film_id,
  title || ' (' || rating || ')'
    film_title,
  COUNT (*) rental_count,
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
  ])[EXTRACT (MONTH FROM MAX (rental_date))]
  || CASE
      WHEN EXTRACT (DAY FROM MAX (rental_date)) > 9 THEN ' '
      ELSE ' 0'
    END
  || CAST (EXTRACT (DAY FROM MAX (rental_date)) AS VARCHAR)
  || ', '
  || CAST (EXTRACT (YEAR FROM MAX (rental_date)) AS VARCHAR)
    last_rental_date
FROM film NATURAL JOIN inventory NATURAL JOIN rental
GROUP BY film_id
HAVING
  MAX (rental_date) < CURRENT_DATE - INTERVAL '1' MONTH
  AND COUNT (*) > 9
ORDER BY
  rental_count DESC,
  last_rental_date DESC,
  title;
