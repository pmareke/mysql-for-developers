SELECT * FROM customer
INNER JOIN payment ON customer.id = payment.customer_id
WHERE payment.amount > 5.99;

SELECT * FROM customer
WHERE 
  id IN (
    SELECT customer_id FROM payment WHERE amount > 5.99
  );
