

# monitoring_and_refinement.sql
# ======================================================

## Step 1: Monitor Query Performance Using EXPLAIN ANALYZE and SHOW PROFILE

-- Analyze a frequently used query (fetch confirmed bookings by date)
EXPLAIN ANALYZE
SELECT  
    b.booking_id,
    b.user_id,
    b.property_id,
    b.status,
    b.check_in_date,
    b.check_out_date,
    u.name AS user_name,
    p.title AS property_title
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
  AND b.check_in_date BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY b.check_in_date ASC;


-- Optional MySQL command for profiling (if supported)
SHOW PROFILE FOR QUERY 1;



## Step 2: Identify Bottlenecks

-- Based on EXPLAIN ANALYZE results:
-- Sequential scans on bookings and properties tables
-- Slow sort operations on unindexed check_in_date
-- Nested loop joins increasing CPU time


## Step 3: Implement Schema and Index Adjustments

-- Add a covering index to improve filtering and ordering by date
CREATE INDEX idx_bookings_status_checkin 
ON bookings(status, check_in_date);

-- Add index on property title for faster property lookups
CREATE INDEX idx_properties_title_search ON properties(title);

-- Add index on user_id to improve JOIN performance
CREATE INDEX idx_users_user_id ON users(user_id);



## Step 4: Measure Query Performance AFTER Adjustments

EXPLAIN ANALYZE
SELECT  
    b.booking_id,
    b.user_id,
    b.property_id,
    b.status,
    b.check_in_date,
    b.check_out_date,
    u.name AS user_name,
    p.title AS property_title
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
  AND b.check_in_date BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY b.check_in_date ASC;


## Step 5: Report Improvements

