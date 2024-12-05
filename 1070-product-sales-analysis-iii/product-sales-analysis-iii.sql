-- Write your PostgreSQL query statement below
SELECT
    product_id, year as first_year, quantity, price
FROM
    Sales
WHERE
    (product_id, year) in
        (SELECT
            product_id, year
        FROM
            (SELECT
                *, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year ASC) AS row_number
            FROM
                Sales) t
        WHERE 
            t.row_number = 1)

