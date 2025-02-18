SELECT Signups.user_id,
       IFNULL(ROUND(COUNT(CASE WHEN Confirmations.action = 'confirmed' THEN 1 END) / COUNT(Confirmations.user_id), 2), 0) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;