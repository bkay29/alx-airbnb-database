
# SQL Aggregation & Window Functions - Airbnb Clone Backend


-- 1. Total Number of Bookings Made by Each User

SELECT  
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;



-- 2. Rank properties based on total number of bookings using ROW_NUMBER()

SELECT
    t.property_id,
    t.property_title,
    t.total_bookings,
    ROW_NUMBER() OVER (ORDER BY t.total_bookings DESC) AS booking_row_number
FROM (
    SELECT
        p.property_id,
        p.title AS property_title,
        COUNT(b.booking_id) AS total_bookings
    FROM properties AS p
    LEFT JOIN bookings AS b
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.title
) AS t
ORDER BY booking_row_number;



-- 3. Rank properties based on total number of bookings using RANK()

SELECT
    t.property_id,
    t.property_title,
    t.total_bookings,
    RANK() OVER (ORDER BY t.total_bookings DESC) AS booking_rank
FROM (
    SELECT
        p.property_id,
        p.title AS property_title,
        COUNT(b.booking_id) AS total_bookings
    FROM properties AS p
    LEFT JOIN bookings AS b
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.title
) AS t
ORDER BY booking_rank;
