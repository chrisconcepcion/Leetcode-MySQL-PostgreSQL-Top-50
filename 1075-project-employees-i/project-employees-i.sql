-- Write your PostgreSQL query statement below
SELECT 
    project_id, round((sum(Employee.experience_years)/COUNT(*)::numeric),2) as average_years
FROM 
    Project
INNER JOIN
    Employee ON project.employee_id = employee.employee_id
GROUP BY
    project_id
