

# ==========================================
# Objective: Analyze and optimize complex queries
# ==========================================

-- 1. Initial Query: Retrieve all bookings with user, property, and payment details
-- Includes WHERE and AND clauses for realistic filtering

SELECT  
    b.booking_id,
    b.user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
INNER JOIN payments AS pay
    ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND pay.status = 'completed'
ORDER BY b.check_in_date DESC;


-- 2. Analyze Query Performance
-- Use EXPLAIN to analyze query execution plan and identify inefficiencies

EXPLAIN
SELECT  
    b.booking_id,
    b.user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.check_in_date,
    b.check_out_date,
    b.status AS booking_status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
INNER JOIN payments AS pay
    ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
  AND pay.status = 'completed'
ORDER BY b.check_in_date DESC;
