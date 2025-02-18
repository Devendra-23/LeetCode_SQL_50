# Write your MySQL query statement below
SELECT Employee.name
FROM Employee
WHERE Employee.id IN(SELECT managerId
                     FROM Employee
                     WHERE managerId IS NOT NULL
                     GROUP BY managerID
                     HAVING COUNT(id)>=5);