-- Write your PostgreSQL query statement below
-- we need to get the first order of all customers.
-- get the total count of all those orders
-- return the percentage of how many of those orders are immediate.
Select
    round(count(case when order_date = customer_pref_delivery_date then 1 else null end) /COUNT(*)::numeric * 100, 2) as immediate_percentage
FROM
    Delivery
WHERE
    (order_date, customer_id) in 
        -- get order date and customer id from first order of each customer based on the oldest order date.
        (SELECT 
            min(order_date) as order_date, customer_id
        FROM
            Delivery
        GROUP BY
            customer_id
        
        )


