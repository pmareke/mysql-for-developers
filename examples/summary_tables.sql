SELECT 
  amount, 
  YEAR(payment_date), 
  MONTH(payment_date)
FROM 
  payments
WHERE 
  payment_date < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01');

SELECT 
  sum(amount) as amount, 
  YEAR(payment_date) as `year`, 
  MONTH(payment_date) as `month`
FROM 
  payments
WHERE 
  payment_date < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
GROUP BY 
  `year`, `month`;

CREATE TABLE payment_summary (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  amount DECIMAL(9,2),
  `year` YEAR,
  `month` TINYINT UNSIGNED
);

INSERT INTO payment_summary (amount, year, month) SELECT 
  sum(amount) as amount, 
  YEAR(payment_date) as `year`, 
  MONTH(payment_date) as `month`
FROM 
  payments
WHERE 
  payment_date < DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
GROUP BY 
  `year`, `month`;

SELECT 
  amount, 
  year, 
  month 
FROM 
  payment_summary

UNION ALL

SELECT 
  sum(amount) as amount, 
  YEAR(payment_date) as `year`, 
  MONTH(payment_date) as `month`
FROM 
  payments
WHERE 
  payment_date >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01');

WITH payment_data AS (
  SELECT 
    amount, 
    year, 
    month 
  FROM 
    payment_summary

  UNION ALL

  SELECT 
    sum(amount) as amount, 
    YEAR(payment_date) as `year`, 
    MONTH(payment_date) as `month`
  FROM 
    payments
  WHERE 
    payment_date >= DATE_FORMAT(CURRENT_DATE, '%Y-%m-01')
);

SELECT * FROM payment_data;
