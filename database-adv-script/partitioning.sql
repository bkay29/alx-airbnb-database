
# ==========================================================
# Objective: Implement table partitioning for performance optimization
# ==========================================================

## Step 1: Create a Partitioned Bookings Table Based on start_date

-- Drop the existing table if necessary
DROP TABLE IF EXISTS bookings_partitioned;

-- Create a new bookings table partitioned by RANGE on start_date
CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);

-- Define partitions by year (example: 2023, 2024, 2025)
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');



## Step 2: Test Query Performance on the Partitioned Table

-- Measure query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT  
    booking_id,
    user_id,
    property_id,
    start_date,
    end_date,
    status
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY start_date ASC;



