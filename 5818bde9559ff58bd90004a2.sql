WITH a AS (SELECT first_name || ' ' || last_name f, film_actor.* FROM
  actor JOIN film_actor USING(actor_id))
SELECT f first_actor, s second_actor, title FROM (
  SELECT * FROM (
    SELECT p.*, RANK() OVER (ORDER BY n DESC) m FROM (
      SELECT
        a.f,
        b.f s,
        title,
        COUNT(*) OVER (PARTITION BY a.actor_id, b.actor_id) n
      FROM a JOIN a b USING (film_id) JOIN film USING (film_id)
      WHERE a.actor_id < b.actor_id) p) u
  WHERE m = 1) v
ORDER BY title
