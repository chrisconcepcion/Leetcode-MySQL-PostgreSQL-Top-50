-- Write your PostgreSQL query statement below
SELECT
    distinct num as ConsecutiveNums
FROM
    (
        SELECT
            id, num, LAG(num) OVER (ORDER BY id) as prev_num, LAG(num, 2) OVER (ORDER BY id) as prev_prev_num
        FROM 
            Logs
    )
WHERE
    num = prev_num AND prev_num = prev_prev_num
