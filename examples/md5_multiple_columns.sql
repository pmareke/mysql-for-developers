ALTER TABLE addresses ADD COLUMN md5 BINARY(16) GENERATED ALWAYS AS (
  UNHEX(MD5(
    CONCAT_WS('|', primary_line, secondary_line, urbanization, last line)
  ))
);

ALTER TABLE addresses ADD UNIQUE INDEX (md5);

