drop table decimals;

CREATE TABLE decimals (
  id INT AUTO_INCREMENT PRIMARY KEY,
  D1 DOUBLE,
  D2 DOUBLE
);

INSERT INTO decimals (D1, D2)
VALUES (100.4, 20.4), (-80.0, 0.0);

SELECT * FROM decimals;

SELECT SUM(D1), SUM(D2) FROM decimals;
