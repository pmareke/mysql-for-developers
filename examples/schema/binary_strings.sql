CREATE TABLE bins (
  bin BINARY(16),
  varbin VARBINARY(100)
);

SELECT UNHEX(MD5('hello'));

INSERT INTO bins (bin, varbin) VALUES (UNHEX(MD5('hello')), UNHEX(MD5('hello')));

SELECT * FROM bins;

SELECT HEX(bin), HEX(varbin) FROM bins;
