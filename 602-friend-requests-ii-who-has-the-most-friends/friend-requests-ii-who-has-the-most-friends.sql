-- Write your PostgreSQL query statement below
SELECT
    id, num
FROM
    (SELECT
        *, ROW_NUMBER() OVER (ORDER BY num DESC)
    FROM
        (SELECT
            accepter_id as id, accepted_count + requested_count as num
        FROM
            (SELECT
                accepter_id, COUNT(*) as accepted_count
            FROM
                RequestAccepted
            GROUP BY
                accepter_id) as AccepterCount
        FULL JOIN
            (
                SELECT
                    requester_id, COUNT(*) as requested_count
                FROM
                    RequestAccepted
                GROUP BY
                    requester_id
            ) as RequesterCount ON RequesterCount.requester_id = AccepterCount.accepter_id
        UNION
        (
                SELECT
                    requester_id as id, COUNT(*) as num
                FROM
                    RequestAccepted
                GROUP BY
                    requester_id
            )
        UNION
            (SELECT
                accepter_id as id, COUNT(*) as num
            FROM
                RequestAccepted
            GROUP BY
                accepter_id)
        )
        
    WHERE   
        NOT id is NULL AND NOT num is NULL) 
WHERE
    row_number = 1


