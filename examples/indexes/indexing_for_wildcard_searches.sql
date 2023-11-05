SELECT * FROM people WHERE email LIKE 'aaron%';

ALTER TABLE people ADD INDEX (email);

SELECT * FROM people WHERE email LIKE 'aaron%';
EXPLAIN SELECT * FROM people WHERE email LIKE 'aaron%';

SELECT * FROM people WHERE email LIKE '%aaron%';
EXPLAIN SELECT * FROM people WHERE email LIKE '%aaron%';

ALTER TABLE people ADD COLUMN email_domain VARCHAR(255) AS (SUBSTRING_INDEX(email, '@', -1));
ALTER TABLE people ADD INDEX (email_domain);

EXPLAIN SELECT * FROM people WHERE email_domain = 'example.com';
SELECT * FROM people WHERE email_domain = 'example.com';
