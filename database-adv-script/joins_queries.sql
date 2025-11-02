
-- Use the Airbnb database
USE airbnb_db;

-- 1. INNER JOIN — Retrieve all bookings and their respective users


SELECT  
    b.booking_id,
    b.property_id,
    b.user_id,
    u.name AS user_name,
    u.email,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id;


-- 2. LEFT JOIN — Retrieve all properties along with their reviews 

SELECT  
    p.property_id,
    p.title AS property_title,
    p.host_id,
    r.review_id,
    r.user_id AS reviewer_id,
    r.rating,
    r.comment,
    r.created_at
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id;
ORDER BY p.property_id;


-- 3. FULL OUTER JOIN — Retrieve all users and their bookings 
(Show all users, even those with no bookings, and all bookings, even if not linked to a user)
Note: FULL OUTER JOIN is not supported in MySQL.
Use the UNION approach below for MySQL-compatible results.

-- For PostgreSQL or SQL Server

SELECT  
    u.user_id,
    u.name AS user_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM users AS u
FULL OUTER JOIN bookings AS b
    ON u.user_id = b.user_id;


-- MySQL-Compatible Version (Emulating FULL OUTER JOIN)

SELECT  
    u.user_id,
    u.name AS user_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id

UNION

SELECT  
    u.user_id,
    u.name AS user_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM users AS u
RIGHT JOIN bookings AS b
    ON u.user_id = b.user_id;

    
