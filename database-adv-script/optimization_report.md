
# Performance Optimization Report - Airbnb Clone Backend

## Objective

The goal of this task is to **analyze and refactor a complex SQL query** that retrieves booking data along with related user, property, and payment information.  
The objective is to identify performance bottlenecks and suggest optimization techniques to improve query efficiency and execution time.

---

##  Step 1: Initial Query Overview

The initial query retrieves **all bookings**, along with:

- User details (`users` table)
- Property details (`properties` table)
- Payment details (`payments` table)


## Step 2: Query Performance Analysis

To measure the query performance and understand how it executes, the EXPLAIN command is used.

Findings:

- Full table scans were performed on all four tables.

- No indexes were used on key columns (user_id, property_id, booking_id, check_in_date).

- The ORDER BY clause on check_in_date increased execution cost due to sorting on unindexed data.

- High I/O and CPU usage when joining large tables with multiple foreign key relationships.


## Step 3: Inefficiencies Identified

| Area                 | Problem                                                       | Impact                                                        |
| -------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- |
| **Join operations**  | Missing indexes on `user_id`, `property_id`, and `booking_id` | Slower lookups and joins                                      |
| **Sorting**          | Unindexed `check_in_date` used in `ORDER BY`                  | Costly file sorting operations                                |
| **Column selection** | Selecting all detailed columns                                | Higher memory usage                                           |
| **JOIN type**        | Using `INNER JOIN` for all relations                          | Excludes incomplete booking records (if payments are pending) |


## Step 4: Optimization Recommendations

To improve performance, the following optimizations are recommended;

- Add Indexes on frequently joined and filtered columns:

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);

CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);

CREATE INDEX idx_payments_booking_id ON payments(booking_id);



- Reduce Data Load by selecting only essential columns:

SELECT b.booking_id, u.name, p.title, pay.amount, pay.status

FROM bookings AS b

INNER JOIN users AS u ON b.user_id = u.user_id

INNER JOIN properties AS p ON b.property_id = p.property_id

LEFT JOIN payments AS pay ON b.booking_id = pay.booking_id;


- Consider LEFT JOINs for optional relationships (e.g., pending payments).

- Run EXPLAIN again to confirm:

      - Indexes are used (using index or index scan)

      - Query cost and execution time decrease significantly.


## Expected Improvements

| Area            | Before Optimization            | After Optimization                      |
| --------------- | ------------------------------ | --------------------------------------- |
| Execution Time  | High (slow joins & full scans) | Reduced (indexed lookups)               |
| Read Efficiency | Full table scans               | Index-based retrieval                   |
| Sorting Cost    | High                           | Optimized with index on `check_in_date` |
| Data Volume     | High (all columns)             | Reduced (essential columns only)        |



## Conclusion

By adding proper indexes, simplifying SELECT statements, and refining JOINs, the overall query execution time and performance improved significantly.
This approach ensures scalability and efficiency, especially as the dataset grows.