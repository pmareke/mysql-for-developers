CREATE TABLE imports (
  id INT NOT NULL AUTO_INCREMENT,
  filename VARCHAR(255),
  owner INT DEFAULT 0,
  available TINYINT DEFAULT 1,
  started_at TIMESTAMP,
  finished_at TIMESTAMP,
  PRIMARY KEY (id),
  INDEX available_owner (available, owner)
);

SELECT 
  * 
FROM 
  imports 
WHERE 
  available = 1 
LIMIT 1;

UPDATE imports 
SET 
  owner = 32, -- unique worker id 
  available = 0 
WHERE 
  owner = 0 
  AND 
  available = 1 
LIMIT 1;

SELECT 
  * 
FROM 
  imports 
WHERE 
  owner = 32;
