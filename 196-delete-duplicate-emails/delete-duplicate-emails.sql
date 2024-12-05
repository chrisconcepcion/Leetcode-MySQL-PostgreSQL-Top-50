-- Write your PostgreSQL query statement below
WITH row_num_person_table AS (
    SELECT  *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) as row_number
    FROM Person
)

DELETE
FROM
    Person 
WHERE
    id in (
            SELECT
                id
            FROM 
                row_num_person_table
            WHERE
                row_number > 1
            
            )


