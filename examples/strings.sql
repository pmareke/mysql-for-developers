CREATE TABLE strings (
  fixed_five CHAR(5),
  fixed_32 CHAR(32)
);

SHOW CREATE TABLE strings;

CREATE TABLE strings (
  variable_length VARCHAR(100)
);

CREATE TABLE strings (
  variable_length VARCHAR(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
);
