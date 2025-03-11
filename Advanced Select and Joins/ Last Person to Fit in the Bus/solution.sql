# Write your MySQL query statement below
WITH CTE AS (
    SELECT person_name, weight, turn, 
           SUM(weight) OVER (ORDER BY turn) AS running_weight
    FROM Queue
)
SELECT person_name 
FROM CTE 
WHERE running_weight <= 1000
ORDER BY running_weight DESC
LIMIT 1;
