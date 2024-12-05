-- Write your PostgreSQL query statement below
-- OBJECTIVE: Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit.
-- 1. Create a new table from Queue with a sum accumulating as we traverse QUEUE by turn with the field name total.
-- 2. Sort by total DESC.
-- 3. Only get the first persons name.
SELECT
    person_name
FROM
    (SELECT 
        person_name, weight, turn, SUM(weight) over (order by turn) as total 
    From
        Queue)
WHERE
    total <= 1000
ORDER BY
    total DESC
LIMIT 1

