-- Write your PostgreSQL query statement below
(SELECT 
    round(COUNT(*)/(SELECT COUNT(*) FROM (SELECT DISTINCT player_id FROM ACTIVITY))::numeric, 2) as fraction
FROM (
    SELECT
        player_id, event_date, LEAD(event_date) OVER (ORDER BY player_id ASC, event_date ASC) AS next_date, LEAD(player_id) OVER (ORDER BY player_id ASC, event_date ASC) AS next_row_player_id ,ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS row_number
    FROM 
        Activity
    ) t
    WHERE t.row_number = 1 and event_date = next_date - 1 and player_id = next_row_player_id)
    
       
    


    


