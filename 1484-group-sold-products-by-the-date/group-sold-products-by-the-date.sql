-- Write your PostgreSQL query statement below
WITH sorted_activities AS (
    SELECT
        distinct sell_date, product
    FROM
        Activities
    ORDER BY
        product
)


SELECT
    sell_date, num_sold, products
FROM
    (SELECT
        sell_date, COUNT(*) as num_sold, STRING_AGG(product, ',') as products
    FROM
        sorted_activities
    GROUP BY
        sell_date)
ORDER BY
    sell_date, products

