ALTER TABLE users ADD COLUMN flags TINYINT UNSIGNED DEFAULT 0;

SELECT * FROM users WHERE flags & 1 = 1;

SELECT * FROM users WHERE flags & 17 = 17;