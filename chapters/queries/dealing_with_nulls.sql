SELECT 
  IFNULL(language_id, 'I don’t know') 
FROM 
  films;

SELECT 
  COALESCE(preferred_language_id, original_language_id) as language_id 
FROM 
  films;
