
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
