
-- Use the Airbnb database

-- 1.  Non-Correlated Subquery — Find properties with an average rating greater than 4.0

SELECT  
    p.property_id,
    p.title AS property_title,
    p.host_id
FROM properties AS p
WHERE p.property_id IN (
    SELECT  
        r.property_id
    FROM reviews AS r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
)
ORDER BY p.property_id;


-- 2. Correlated Subquery — Find users who have made more than 3 bookings
SELECT  
    u.user_id,
    u.name AS user_name,
    u.email
FROM users AS u
WHERE (
    SELECT COUNT(*) 
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY u.user_id;
