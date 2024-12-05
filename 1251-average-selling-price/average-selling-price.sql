-- Write your PostgreSQL query statement below
SELECT
    Prices.product_id,  coalesce(round(sum(UnitsSold.units * Prices.price)/sum(UnitsSold.units::numeric), 2), 0) as average_price
FROM
    Prices
LEFT JOIN
    UnitsSold ON Prices.start_date <= UnitsSold.purchase_date AND Prices.end_date >= UnitsSold.purchase_date AND Prices.product_id = UnitsSold.product_id
GROUP BY
    Prices.product_id  

