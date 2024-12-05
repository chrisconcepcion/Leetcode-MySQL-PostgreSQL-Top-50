-- Write your PostgreSQL query statement below
SELECT WeatherTemp.id
FROM (SELECT Weather.id, Weather.recordDate, Weather.temperature,  -- Create a temp table containing recordDate, temperature, prevDayTemp and prevDay
        LAG(temperature) OVER(ORDER BY Weather.recordDate) AS prevDayTemp, LAG(recordDate) OVER(ORDER BY Weather.recordDate)  AS prevDay
    FROM Weather) as WeatherTemp
WHERE WeatherTemp.temperature > WeatherTemp.prevDayTemp and (WeatherTemp.recordDate) = (WeatherTemp.prevDay + 1) -- Only include records which temperature > prevDayTemp and recordDate == prevDay + 1