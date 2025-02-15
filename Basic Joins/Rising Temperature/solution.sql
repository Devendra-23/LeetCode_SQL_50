SELECT Weather.id
FROM Weather
JOIN Weather AS PrevWeather
ON DATE_SUB(Weather.recordDate, INTERVAL 1 DAY) = PrevWeather.recordDate
WHERE Weather.temperature > PrevWeather.temperature;
