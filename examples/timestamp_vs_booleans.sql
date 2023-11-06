CREATE TABLE posts(
  title VARCHAR(125),
  is_archived BOOLEAN
);

SELECT * FROM posts WHERE is_archived = false;

CREATE TABLE posts(
  title VARCHAR(125),
  archived_at timestamp null
);

SELECT * FROM posts WHERE archived_at IS NULL;

