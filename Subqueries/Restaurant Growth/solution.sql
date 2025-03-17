# Write your MySQL query statement below
WITH DailyTotal AS (
    SELECT 
        visited_on,
        SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
)

SELECT 
    d1.visited_on,
    SUM(d2.total_amount) AS amount,
    ROUND(SUM(d2.total_amount) / 7, 2) AS average_amount
FROM DailyTotal d1
JOIN DailyTotal d2 
  ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(*) = 7
ORDER BY d1.visited_on;
