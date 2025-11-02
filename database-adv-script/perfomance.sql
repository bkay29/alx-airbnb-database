
# SQL Performance Optimization - Airbnb Clone Backend

-- ===================================================
-- 1. Initial Query: Retrieve all bookings with user, property, and payment details
-- ===================================================

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
ORDER BY b.check_in_date DESC;



-- ===================================================
-- 2. Analyze Query Performance Using EXPLAIN
-- ===================================================

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
ORDER BY b.check_in_date DESC;



-- ===================================================
-- 3.  Observations & Inefficiencies (for documentation)
-- ===================================================
-- ❌ Full table scans likely on users, properties, and payments.
-- ❌ No indexes used on foreign key columns (user_id, property_id, booking_id).
-- ❌ Sorting (ORDER BY b.check_in_date) may cause temporary file usage if unindexed.

-- ✅ Recommended Refactor (to be implemented in next step):
--    - Add indexes on bookings.user_id, bookings.property_id, payments.booking_id, and bookings.check_in_date.
--    - Use only necessary columns in SELECT to reduce I/O load.
--    - Consider LEFT JOINs if not all bookings have payments yet.
