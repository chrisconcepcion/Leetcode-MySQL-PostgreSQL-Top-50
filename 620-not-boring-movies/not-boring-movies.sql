-- Write your PostgreSQL query statement below
SELECT
    id, movie, description, rating
FROM
    Cinema
WHERE 
    NOT Cinema.description = 'boring' and NOT Cinema.id % 2 = 0
ORDER BY 
    Rating DESC
