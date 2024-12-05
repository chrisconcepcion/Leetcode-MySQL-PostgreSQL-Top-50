-- Write your PostgreSQL query statement below
-- manager an employee who has at least 1 other employee reporting to them.
SELECT
    employee_id, name, reports_count, average_age
FROM
    Employees
INNER JOIN
    (SELECT
        reports_to as manager_id, COUNT(*) as reports_count, round(sum(age)/COUNT(*)::numeric, 0) as average_age
    FROM
        Employees
    WHERE
        NOT reports_to is NULL
    GROUP BY
        reports_to) as Manager ON Manager.manager_id = Employees.employee_id
ORDER BY
    employee_id


        
        