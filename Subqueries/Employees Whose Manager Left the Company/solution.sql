SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE e.salary < 30000
AND e.manager_id IS NOT NULL  -- Ensure the employee has a manager
AND m.employee_id IS NULL     -- The manager does not exist in the Employees table
ORDER BY e.employee_id;
