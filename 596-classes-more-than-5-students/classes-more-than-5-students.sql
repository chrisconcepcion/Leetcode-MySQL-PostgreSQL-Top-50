-- Write your PostgreSQL query statement below
SELECT
    class
FROM
    (SELECT
        class, COUNT(*) as count
    FROM
        Courses
    GROUP BY
        class)
WHERE
    count > 4
