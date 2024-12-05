-- Write your PostgreSQL query statement below
-- A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
-- OBJECTIVE: Write a solution to find the employees who are high earners in each of the departments.
-- MERGE Employee table with department based on department id.


SELECT
    department_name as Department, name as Employee, salary as Salary
FROM
    (SELECT
        Employee.id, Employee.name, Employee.salary, Department.name as department_name
    FROM
        Department
    INNER JOIN
        Employee ON Employee.departmentId = Department.id
    )
WHERE
    (salary, department_name) in 
        (SELECT
           salary, department_name
        FROM
            (SELECT
                *, ROW_NUMBER() OVER (Partition BY department_name ORDER BY salary DESC)
            FROM
                (SELECT
                        distinct salary, department_name
                    FROM
                        (SELECT
                            Employee.id, Employee.name, Employee.salary, Department.name as department_name
                        FROM
                            Department
                        INNER JOIN
                            Employee ON Employee.departmentId = Department.id
                        )
                )
            ) as Temp
        WHERE
            row_number < 4
        GROUP BY
            Temp.salary, Temp.department_name
        )
        


