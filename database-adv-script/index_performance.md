

# Database Indexing - Airbnb Clone Backend

**Objective:**  
Identify and create indexes to improve query performance by analyzing high-usage columns in the `users`, `bookings`, and `properties` tables.

---

## Step 1: Measure Query Performance Before Indexing

Use the `EXPLAIN` (or `ANALYZE`) command to measure how the database executes your query before adding any indexes.

```sql
EXPLAIN
SELECT  
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    p.title AS property_title
FROM users AS u
INNER JOIN bookings AS b
    ON u.user_id = b.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE u.email LIKE '%gmail.com%'
ORDER BY b.created_at DESC;



## Step 2: Create Indexes on High-Usage Columns

Now create indexes on the most frequently used columns in WHERE, JOIN, and ORDER BY clauses.

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



## Step 3: Measure Query Performance After Indexing

Run the same query again using EXPLAIN or ANALYZE to observe the performance improvement.

EXPLAIN
SELECT  
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    p.title AS property_title
FROM users AS u
INNER JOIN bookings AS b
    ON u.user_id = b.user_id
INNER JOIN properties AS p
    ON b.property_id = p.property_id
WHERE u.email LIKE '%gmail.com%'
ORDER BY b.created_at DESC;




