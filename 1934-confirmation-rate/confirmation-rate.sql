-- Write your PostgreSQL query statement below
SELECT Signups.user_id, ROUND((count(case when Confirmations.action = 'confirmed' then 1 else null end)/COUNT(*)::numeric),2) as confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Confirmations.user_id = Signups.user_id
GROUP BY Signups.user_id
  
    