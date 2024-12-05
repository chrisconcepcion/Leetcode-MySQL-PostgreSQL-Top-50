-- Write your PostgreSQL query statement below
SELECT
    *
FROM
    Patients
WHERE
    position('DIAB1' in conditions) > 0 AND ( position('DIAB1' in conditions) = 1 OR (substring(conditions from (position('DIAB1' in conditions) - 1) for 1 ) = ' ') )
