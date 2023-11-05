SELECT 1 
UNION 
SELECT 2;

SELECT 
  first_name, 
  last_name, 
  email_address 
FROM customers 

UNION ALL 

SELECT 
  first_name, 
  last_name, 
  email_address 
FROM staff;
