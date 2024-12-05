-- Write your PostgreSQL query statement below
SELECT
    employee_id
FROM
    (SELECT
        employee_id, manager_id  
    FROM
        Employees
    WHERE
        salary < 30000)
WHERE NOT
    manager_id IN (SELECT employee_id FROM Employees)
ORDER BY
    employee_id ASC
    
