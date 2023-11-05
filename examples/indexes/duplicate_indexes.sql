ALTER TABLE people ADD INDEX first_name (first_name);
ALTER TABLE people ADD INDEX full_name (first_name, last_name, birthday);

ALTER TABLE people ALTER INDEX first_name INVISIBLE;

SELECT * FROM people WHERE first_name = 'Aaron' ORDER BY id DESC;

