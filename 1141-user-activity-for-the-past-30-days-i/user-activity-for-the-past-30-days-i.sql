-- Write your PostgreSQL query statement below
-- unique user count per day
SELECT
    activity_date as day, COUNT(*) as active_users
FROM
    (SELECT
        DISTINCT user_id, activity_date
    FROM
        Activity
    WHERE
        activity_date > '2019-06-27' and activity_date < '2019-07-28')
GROUP BY
    activity_date

    