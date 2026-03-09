SELECT
  2007 "year",
  "month",
  name category,
  CAST (FLOOR (SUM (amount)) AS INT) revenue
FROM
  category
  JOIN film_category USING (category_id)
  JOIN inventory USING (film_id)
  JOIN rental USING (inventory_id)
  JOIN (
    SELECT
      payment.*,
      CAST (EXTRACT (MONTH FROM payment_date) AS INT) "month"
    FROM payment
    WHERE EXTRACT (YEAR FROM payment_date) = 2007
  ) a USING (rental_id)
GROUP BY ROLLUP ("month", category)
ORDER BY
  "month" NULLS LAST,
  revenue DESC,
  name;
