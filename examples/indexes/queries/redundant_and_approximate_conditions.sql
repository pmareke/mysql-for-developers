SELECT * FROM people WHERE id <= 5;

SELECT * FROM people 
  WHERE 
    id <= 5
    AND
    id <= 10;

SELECT * FROM todos 
  WHERE 
  ADDTIME(due_date, due_time) BETWEEN NOW() AND NOW() + INTERVAL 1 DAY;

SELECT * FROM todos 
  WHERE 
  ADDTIME(due_date, due_time) BETWEEN NOW() AND NOW() + INTERVAL 1 DAY
  AND
  due_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL 1 DAY;
