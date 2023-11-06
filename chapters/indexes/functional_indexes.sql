CREATE TABLE people (
  id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birthday DATE NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE people ADD INDEX idx_month_birth ((MONTH(birthday)));

