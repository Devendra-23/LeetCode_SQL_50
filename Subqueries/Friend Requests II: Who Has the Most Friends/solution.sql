# Write your MySQL query statement below
WITH FriendCounts AS (
    SELECT id, COUNT(*) AS num
    FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    ) AS all_friends
    GROUP BY id
),
MaxCount AS (
    SELECT MAX(num) AS max_num FROM FriendCounts
)
SELECT id, num
FROM FriendCounts
WHERE num = (SELECT max_num FROM MaxCount);
