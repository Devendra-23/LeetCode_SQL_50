WITH ProductCount AS (
    SELECT COUNT(*) AS total_products FROM Product
),
CustomerProductCount AS (
    SELECT customer_id, COUNT(DISTINCT product_key) AS purchased_products
    FROM Customer
    GROUP BY customer_id
)
SELECT c.customer_id
FROM CustomerProductCount c
JOIN ProductCount p
ON c.purchased_products = p.total_products;
