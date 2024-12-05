-- Write your PostgreSQL query statement below
SELECT
    (SELECT
        num
    FROM
        (SELECT
            num, COUNT(*) as count
        FROM
            MyNumbers
        GROUP BY
            num
        ORDER BY
            num DESC)
    WHERE
        count = 1
    LIMIT 1)
