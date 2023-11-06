CREATE TABLE emails (
  email varchar(255),
  domain varchar(255) AS (substring_index(email, '@', -1))
);

