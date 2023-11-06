DROP TABLE urls;

CREATE TABLE urls (
  ID BIGINT PRIMARY KEY AUTO_INCREMENT,
  url VARCHAR(1000)
);

INSERT INTO urls (url) VALUES ('www.google.com'), ('specific_value');

SELECT * FROM urls WHERE url = 'specific_value';

SELECT * FROM urls WHERE url = 'specific_value';

SHOW INDEXES FROM urls;

SELECT * FROM urls WHERE url_md5 = MD5('specific_value');

ALTER TABLE urls ADD COLUMN url_md5 binary(16) GENERATED ALWAYS AS (UNHEX(MD5(url)));

ALTER TABLE urls ADD INDEX (url_md5);

SELECT * FROM urls WHERE url_md5 = UNHEX(MD5('specific_value'));