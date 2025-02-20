SELECT 
    Prices.product_id,
    ROUND(SUM(Prices.price * UnitsSold.units) / NULLIF(SUM(UnitsSold.units), 0), 2) AS average_price
FROM Prices
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id 
AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;