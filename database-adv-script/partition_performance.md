
#  Table Partitioning Report - Airbnb Clone Backend

## Objective

The objective of this task was to **optimize query performance** on large datasets by implementing **table partitioning** on the `bookings` table.  
Since booking data grows rapidly in production environments, queries filtering by date ranges (e.g., monthly or yearly reports) can become increasingly slow.  
Partitioning allows the database to divide large tables into smaller, more manageable parts, improving read and write efficiency.

---

## Step 1: Partitioning Strategy

- I applied **RANGE partitioning** based on the `start_date` column, the most common filter used in analytical and reporting queries.

- Each partition corresponds to a specific yearly range:

- The structure ensures that all bookings created in a given year are stored within the corresponding yearly partition.


## Step 2: Query Performance Testing

To evaluate the performance impact, I used EXPLAIN ANALYZE to measure the cost of querying the partitioned table versus a non-partitioned version.

refer to Test Query provided


## Step 3: Observed Improvements

| Metric                 | Before Partitioning                     | After Partitioning                              | Improvement             |
| ---------------------- | --------------------------------------- | ----------------------------------------------- | ----------------------- |
| **Query Scope**        | Full table scan (entire bookings table) | Scans only relevant partition (`bookings_2025`) | ✅ Reduced I/O           |
| **Execution Cost**     | High (scans all records)                | Low (partition pruning)                         | ✅ Faster lookups        |
| **Insert Performance** | Slower (single table writes)            | Faster (data distributed across partitions)     | ✅ Better scalability    |
| **Maintenance**        | Complex (vacuum/analyze large table)    | Easier (per-partition maintenance)              | ✅ Simplified management |




## Step 4: Key Benefits

- Faster Queries - The database only scans relevant partitions, drastically reducing query time for date-based searches.

- Scalability - Easier to manage data growth since new partitions can be added dynamically (e.g., yearly).

- Improved Maintenance - Each partition can be vacuumed, backed up, or analyzed independently.

- Reduced I/O and CPU Load - Less unnecessary data scanning for frequent reporting queries.

- Simplified Archiving - Older partitions (e.g., 2023 data) can be archived or dropped safely.



## Conclusion

Partitioning the bookings table by the start_date column significantly improves performance for queries filtering by date ranges.
This approach ensures the Airbnb Clone backend remains efficient, scalable, and optimized for large datasets — especially as the platform grows in users and bookings.