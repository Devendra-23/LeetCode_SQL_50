SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT 
        e.id,
        e.name,
        e.salary,
        e.departmentId,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS sal_rank
    FROM Employee e
) e
JOIN Department d 
ON e.departmentId = d.id
WHERE e.sal_rank <= 3;
