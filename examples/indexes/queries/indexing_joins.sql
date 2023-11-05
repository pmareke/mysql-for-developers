SELECT 
  film.title, actor.first_name, actor.last_name
FROM film
  LEFT JOIN film_actor ON film_actor.film_id = film.id
  LEFT JOIN actor ON actor.id = film_actor.actor_id
WHERE 
  film.id <= 10
LIMIT 10;

ALTER TABLE film_actor ADD INDEX idx_fk_film_id (film_id);

EXPLAIN SELECT 
  film.title, actor.first_name, actor.last_name
FROM film
  LEFT JOIN film_actor ON film_actor.film_id = film.id
  LEFT JOIN actor ON actor.id = film_actor.actor_id
WHERE 
  film.id <= 10

ALTER TABLE film_actor ALTER INDEX idx_film_id INVISIBLE;

EXPLAIN SELECT 
  film.title, actor.first_name, actor.last_name
FROM film
  LEFT JOIN film_actor ON film_actor.film_id = film.id
  LEFT JOIN actor ON actor.id = film_actor.actor_id
WHERE 
  film.id <= 10
