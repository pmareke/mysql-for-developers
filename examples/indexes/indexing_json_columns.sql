-- Method 1: generating a column

ALTER TABLE json_data ADD COLUMN email VARCHAR(255) GENERATED ALWAYS AS (`json` ->> '$.email');

ALTER TABLE json_data ADD INDEX (email);

-- Method 2: Function-based index

ALTER TABLE json_data ADD INDEX ((
    CAST(`json`->>'$.email') AS CHAR(255) COLLATE utf8mb4_bin)
));
