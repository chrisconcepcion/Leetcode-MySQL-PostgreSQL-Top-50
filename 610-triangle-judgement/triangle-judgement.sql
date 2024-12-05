-- Write your PostgreSQL query statement below
-- Length of one side is less than sum of length 2 others sides.
SELECT
    x, y, z, (case when ( x + y > z AND x + z > y AND y + z > x) then 'Yes' else 'No' end) as triangle 
FROM 
    Triangle