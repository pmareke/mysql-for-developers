ALTER TABLE people ADD FULLTEXT INDEX `fulltext`(first_name, last_name, bio);

SELECT * FROM people WHERE MATCH(first_name, last_name, bio) AGAINST('Aaron');

SELECT * FROM people 
  WHERE MATCH(first_name, last_name, bio) AGAINST('+Aaron -Francis' IN BOOLEAN MODE);
