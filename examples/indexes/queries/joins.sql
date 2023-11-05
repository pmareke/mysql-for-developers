SELECT * FROM store;
SELECT * FROM staff;

SELECT * FROM store
  INNER JOIN staff ON store.manager_staff_id = staff.id;

SELECT * FROM store
  LEFT JOIN staff ON store.manager_staff_id = staff.id;

SELECT * FROM store
  RIGHT JOIN staff ON store.manager_staff_id = staff.id;

