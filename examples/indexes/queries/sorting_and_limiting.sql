SELECT * FROM people LIMIT 10;

SELECT id, birthday FROM people ORDER BY birthday;

SELECT id, birthday FROM people ORDER BY birthday DESC;

SELECT id, birthday FROM people ORDER BY birthday, id;

SELECT id, birthday FROM people ORDER BY birthday, id LIMIT 100 OFFSET 20;

