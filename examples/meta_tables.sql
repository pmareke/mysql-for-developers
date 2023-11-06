SELECT 
  * 
FROM 
  film_narrow
INNER JOIN film_addendum ON film_narrow.id = film_addendum.film_id;

