WITH RECURSIVE numbers AS (
  SELECT 1 AS n -- Initial Condition
  UNION ALL
  SELECT n + 1 FROM numbers WHERE n < 10 -- Recursive Condition
)

SELECT * FROM numbers;

WITH RECURSIVE all_dates AS (
  SELECT '2023-01-01' AS dt -- Initial Condition
  UNION ALL
  SELECT dt + INTERVAL 1 DAY FROM all_dates WHERE dt < '2023-12-31' -- Recursive Condition
)
SELECT * FROM all_dates;

WITH RECURSIVE all_dates AS (
  SELECT '2023-01-01' AS dt -- Initial Condition
  UNION ALL
  SELECT dt + INTERVAL 1 DAY FROM all_dates WHERE dt < '2023-12-31' -- Recursive Condition
)

SELECT
  dt,
  sum(ammount)
FROM 
  all_dates
  LEFT JOIN payments ON all_dates.dt = payments.date;

