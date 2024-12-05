-- Write your PostgreSQL query statement below
SELECT
    Register.contest_id, round((COUNT(*) / (SELECT COUNT(*) FROM Users)::numeric)*100 , 2)AS percentage
FROM
    Register
GROUP BY
    Register.contest_id
ORDER BY
    percentage DESC,  Register.contest_id ASC