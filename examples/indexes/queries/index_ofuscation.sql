-- BAD
SELECT * FROM film WHERE length / 60 < 2;

-- BETTER
SELECT * FROM film WHERE length < 2 * 60;
