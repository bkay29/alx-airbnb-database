

## Step 1: Measure Query Performance BEFORE Indexing

EXPLAIN ANALYZE
SELECT  
    b.booking_id,
    b.user_id,
    u.name AS user_name,
    b.property_id,
    p.title AS property_title,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
ORDER BY b.check_in_date DESC;



## Step 2: Create Indexes on High-Usage Columns

-- Index on user email for faster lookups and filters
CREATE INDEX idx_users_email ON users(email);

-- Index on user_id in bookings for JOIN operations
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings for JOIN operations
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on created_at in bookings for ORDER BY sorting
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Index on property title for quick text-based searches
CREATE INDEX idx_properties_title ON properties(title);

-- Composite index for frequent combined lookups on user_id and property_id
CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);



## Step 3: Measure Query Performance AFTER Indexing

EXPLAIN ANALYZE
SELECT  
    b.booking_id,
    b.user_id,
    u.name AS user_name,
    b.property_id,
    p.title AS property_title,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
ORDER BY b.check_in_date DESC;
