-- Write your PostgreSQL query statement below
SELECT DISTINCT author_id as ID
FROM Views
WHERE author_id = viewer_id