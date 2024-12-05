-- Write your PostgreSQL query statement below
-- OBJECTIVE: report the sum of all total investment values in 2016 tiv_2016.
-- Find users with tiv_2015, must be more than one.
-- exclude the tiv_2016 of users from the previous query that share the same lat and long.
SELECT
    sum(tiv_2016)::numeric as tiv_2016
FROM
    Insurance
WHERE
    tiv_2015 in (SELECT
                    tiv_2015
                FROM
                    (   
                        SELECT
                            *
                        FROM
                            (SELECT
                                tiv_2015, COUNT(*)
                            FROM
                                Insurance
                            GROUP BY
                                tiv_2015
                            ORDER BY
                                count DESC)
                    )
                WHERE
                    count > 1)
    AND NOT (lat, lon) in ((SELECT
                            lat, lon
                        FROM
                         (    
                        SELECT
                            lat, lon, COUNT(*)
                        FROM 
                            Insurance
                        GROUP BY
                            lat, lon
    
                        )
                        WHERE
                            count > 1))
                       
                   
    
