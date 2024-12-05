-- Write your PostgreSQL query statement below
Select Temp.machine_id,ROUND(CAST(SUM(time_difference) / COUNT(*) AS numeric), 3) AS processing_time
From (SELECT Activity.machine_id, MAX(Activity.timestamp) - MIN(Activity.timestamp) AS time_difference
FROM Activity
GROUP BY Activity.machine_id, Activity.process_id) as Temp
GROUP BY Temp.machine_id

