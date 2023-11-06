SELECT 
  * 
FROM 
  people 
ORDER BY 
  birthday, id 
LIMIT 20 
OFFSET 450000;

SELECT id FROM people;

SELECT * FROM people 
INNER JOIN (
  SELECT id FROM people ORDER BY birthday, id LIMIT 20 OFFSET 450000
) AS people2 USING (id)
ORDER BY 
  birthday, id;

ALTER TABLE people ADD INDEX birthday (birthday);

