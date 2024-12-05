-- Write your PostgreSQL query statement below
-- we want a group by customer_id table containing unique product ids
SELECT
    customer_id
FROM
    (SELECT
        customer_id, COUNT(*)
    FROM
        (SELECT
            distinct customer_id, product_key
        FROM
            Customer)
    GROUP BY
        customer_id)
WHERE
    count = (SELECT COUNT(*) FROM Product)
