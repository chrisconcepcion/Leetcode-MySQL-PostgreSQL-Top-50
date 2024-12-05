-- Write your PostgreSQL query statement below
-- We need the price of all products on 2019-08-16, assume default price is 10.
-- We need to get price changes for all products on 2019-08-16 or before but not after.
-- 1. Get products which which have a change data of less than '2019-08-17', 
-- 2. Sort products table in DESC and get the first row per product id. and dump prices after 8-16.
SELECT
    product_id, price
FROM
    (SELECT
        product_id, new_price as price
    FROM
        (   SELECT
                * , ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS row_number
            FROM
                Products
            WHERE
                change_date < '2019-08-17'
        ) t
    WHERE 
        t.row_number = 1)
-- 3. UNION with a default price table, this table is all products whose id does not appear in our table above.
-- These products get a default price of 10.
UNION
    (SELECT
        DISTINCT product_id, 10 as price
    FROM
        Products
    WHERE
        NOT product_id in (SELECT
            product_id
        FROM
            (   SELECT
                    * , ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date ASC) AS row_number
                FROM
                    Products
                WHERE
                    change_date < '2019-08-17'
            ) t
        WHERE 
            t.row_number = 1) AND change_date > '2019-08-16') 
    
