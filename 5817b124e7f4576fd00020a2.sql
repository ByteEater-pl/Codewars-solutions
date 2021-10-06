SELECT title
FROM film JOIN film_actor USING (film_id)
-- Should work but doesn't: `FROM film NATURAL JOIN film_actor`.
-- The schema is different than given in the problem statement!
WHERE actor_id IN (105, 122)
GROUP BY title
HAVING COUNT(*) = 2
ORDER BY title
