-- Write your PostgreSQL query statement below
SELECT
    teacher_id, COUNT(*) as cnt
FROM 
    (SELECT
        DISTINCT teacher_id, subject_id
    FROM
        Teacher)
GROUP BY
    teacher_id
