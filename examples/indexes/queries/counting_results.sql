SELECT 
  rental_date, DAYOFWEEK(rental_date)
FROM 
  rental;

SELECT 
  COUNT(IF(DAYOFWEEK(rental_date) IN (1, 7), 1, NULL)) AS weekend_rentals,
  COUNT(IF(DAYOFWEEK(rental_date) NOT IN (1, 7), 1, NULL)) AS weekday_rentals,
  COUNT(return_date) AS completed_rentals,
  COUNT(*) AS total_rentals
FROM 
  rental;

SELECT 
  SUM(DAYOFWEEK(rental_date) IN (1, 7)) AS weekend_rentals,
  SUM(DAYOFWEEK(rental_date) NOT IN (1, 7)) AS weekday_rentals,
  COUNT(return_date) AS completed_rentals,
  COUNT(*) AS total_rentals
FROM 
  rental;
