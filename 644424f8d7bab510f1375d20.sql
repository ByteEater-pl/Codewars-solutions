SELECT
  film_id,
  title,
  length
FROM
  film,
  (
    SELECT
        MIN (length)
        FILTER (WHERE rating = 'R')
      l,
        PERCENTILE_DISC (.5)
        WITHIN GROUP (ORDER BY length)
        FILTER (WHERE rating = 'PG-13')
      u
    FROM film
  ) a
WHERE length NOT BETWEEN l AND u
ORDER BY
  length,
  title,
  film_id;
