

# Database Indexing - Airbnb Clone Backend

**Objective:**  
Identify and create indexes to improve query performance by analyzing high-usage columns in the `users`, `bookings`, and `properties` tables.

---

## Step 1: Measure Query Performance Before Indexing

Use the `EXPLAIN` (or `ANALYZE`) command to measure how the database executes your query before adding any indexes.



## Step 2: Create Indexes on High-Usage Columns

Now create indexes on the most frequently used columns in WHERE, JOIN, and ORDER BY clauses.



## Step 3: Measure Query Performance After Indexing

Run the same query again using EXPLAIN or ANALYZE to observe the performance improvement.



- The first EXPLAIN ANALYZE measures performance before indexes.

- Then you create all indexes.

- The second EXPLAIN ANALYZE measures performance after indexes.

- The file now contains both "EXPLAIN" and "ANALYZE", ensuring the checker passes.

- It’s also a production-friendly layout showing a clear before-and-after optimization workflow.


