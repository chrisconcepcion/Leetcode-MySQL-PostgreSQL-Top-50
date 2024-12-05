-- Write your PostgreSQL query statement below
SELECT(SELECT
        DISTINCT salary as SecondHighestSalary
    FROM 
        Employee
    ORDER BY 
        SALARY DESC
    OFFSET 1
    LIMIT 1
)