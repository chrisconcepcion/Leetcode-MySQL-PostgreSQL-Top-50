-- Write your PostgreSQL query statement below
-- We need to get all employees who belong to one department
-- Then we get all employees who belongs to multiple departments.
SELECT
    employee_id, department_id
FROM 
    Employee
WHERE
    
    employee_id in (SELECT
        employee_id
    FROM
        (SELECT
            employee_id, COUNT(*)
        FROM 
            Employee
        GROUP BY
            employee_id)
    Where
        count = 1)
    OR 
        primary_flag = 'Y'

