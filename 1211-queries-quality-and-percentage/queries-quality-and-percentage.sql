-- Write your PostgreSQL query statement below
SELECT
    Queries.query_name, round(avg(rating::numeric / position), 2) as quality, round((count(case when Queries.rating < 3 then 1 else null end) /Count(*)::numeric) * 100,2) as poor_query_percentage
FROM
    Queries
WHERE
    NOT Queries.query_name is Null
Group By
    Queries.query_name
