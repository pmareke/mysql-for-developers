CREATE TABLE has_json (
  id INT(11) NOT NULL AUTO_INCREMENT,
  json JSON NULL,
  PRIMARY KEY (id)
);

INSERT INTO has_json (json) VALUES ('{key:value}');

-- > Error: Invalid JSON text: "Missing a name for object member." at position 1 in value for column 'has_json.json'.

INSERT INTO has_json (json) VALUES ('{"key": "value"}');

SELECT json FROM has_json;

SELECT `json`->>"$.key" as key FROM has_json;

ALTER TABLE has_json ADD INDEX my_index ((`json`->>"$.key"));
