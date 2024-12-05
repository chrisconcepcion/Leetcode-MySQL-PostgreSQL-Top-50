-- Write your PostgreSQL query statement below
SELECT  
    'Low Salary' as category, COUNT(*) as accounts_count
FROM 
    Accounts
WHERE
    income < 20000
UNION
    (   
        SELECT  
            'Average Salary' as category, COUNT(*) as accounts_count
        FROM 
            Accounts
        WHERE
            income >= 20000 and income <= 50000
    )
UNION
    (   
        SELECT  
            'High Salary' as category, COUNT(*) as accounts_count
        FROM 
            Accounts
        WHERE
            income > 50000
    )