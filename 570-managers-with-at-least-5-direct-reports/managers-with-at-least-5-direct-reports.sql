-- Write your PostgreSQL query statement below
SELECT Employee.name
FROM (
    SELECT Employee.managerId, COUNT(*) as count
    FROM Employee
    GROUP BY Employee.managerId) as Manager
INNER JOIN Employee ON Manager.managerId = Employee.id
WHERE count > 4

