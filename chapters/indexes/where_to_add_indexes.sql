ALTER TABLE people ADD INDEX birthday_index (birthday);

SELECT * FROM people WHERE birthday = '1989-02-14';

SELECT * FROM people WHERE birthday >= '2006-01-01';

SELECT * FROM people WHERE birthday BETWEEN '2006-01-01' AND '2006-12-31';

SELECT * FROM people ORDER BY birthday LIMIT 10;

SELECT birthday, COUNT(*) FROM people GROUP BY birthday;
