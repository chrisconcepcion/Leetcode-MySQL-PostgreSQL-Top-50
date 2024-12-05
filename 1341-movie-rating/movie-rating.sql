-- Write your PostgreSQL query statement below
SELECT
    name as results
FROM
    (SELECT
        customTable.name, ROW_NUMBER() OVER (ORDER BY count DESC, customTable.name ASC) as row_number, count
    FROM
        (
            SELECT
                Users.name, COUNT(*)
            FROM 
                MovieRating
            INNER JOIN
                Users ON Users.user_id = MovieRating.user_id
            GROUP BY
                Users.name

        ) as customTable
    ORDER BY
        count DESC, customTable.name ASC
    )
WHERE
    row_number = 1
UNION ALL
    SELECT
        title as results
    FROM
        (SELECT
            *, ROW_NUMBER() OVER (ORDER BY average DESC, title ASC) as row_number
        FROM
            (
                SELECT
                    Movies.title, sum(rating::numeric)/COUNT(*) as average
                FROM 
                    MovieRating
                INNER JOIN
                    Movies ON Movies.movie_id = MovieRating.movie_id
                WHERE
                    created_at > '2020-01-31' AND created_at < '2020-03-01'
                GROUP BY
                    Movies.title


            ) as customTable2)
    WHERE
            row_number = 1

    
    
        
