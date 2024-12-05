-- Write your PostgreSQL query statement below
WITH ordered_products as (
    SELECT
        Products.product_id as product_product_id, product_name, product_category, order_date, unit
    FROM
        Products
    INNER JOIN
        Orders ON Orders.product_id = Products.product_id
    WHERE
        order_date > '2020-01-31' AND order_date < '2020-03-01'
)

SELECT
    *
FROM
(SELECT
    product_name, sum(unit) as unit
FROM
    ordered_products
GROUP BY
    product_name)
WHERE
    unit >= 100



