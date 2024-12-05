-- Write your PostgreSQL query statement below
SELECT
    (case when id % 2 = 0 then prev_id else (case when next_id is NULL then id else next_id end) end) as id, student
FROM
    (SELECT
        *, LAG(id) OVER(ORDER BY id) as prev_id, LEAD(id) OVER(ORDER BY id) as next_id
    FROM
        Seat)
ORDER BY
    id ASC


