-- Write your PostgreSQL query statement below
SELECT
    to_char(trans_date, 'YYYY-MM') as month, country, COUNT(*) as trans_count, count(case when Transactions.state = 'approved' then 1 else null end) as approved_count, sum(amount) as trans_total_amount, sum(case when Transactions.state = 'approved' then Transactions.amount else 0 end) as approved_total_amount
FROM
    Transactions
GROUP BY
    to_char(trans_date, 'YYYY-MM'), country