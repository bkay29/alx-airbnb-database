
# SQL Aggregation & Window Functions - Airbnb Clone Backend

## 1. Total Number of Bookings Made by Each User

SELECT  
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;


## 2. Rank Properties Based on Total Number of Bookings

SELECT  
    p.property_id,
    p.title AS property_title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties AS p
LEFT JOIN bookings AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY booking_rank;

