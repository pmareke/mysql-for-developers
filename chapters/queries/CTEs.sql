WITH spend_last_6 AS (
  SELECT
    customer_id,
    SUM(amount) AS total_spend
  FROM 
    payment
    INNER JOIN customer ON customer.id = payment.customer_id
  WHERE
    store_id = 1
    AND payment_date > CURRENT_DATE - INTERVAL 6 MONTH
  GROUP BY
    cusomter_id
);

SELECT * FROM spend_last_6;
