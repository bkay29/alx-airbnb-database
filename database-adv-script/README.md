# SQL Joins - Airbnb Clone Backend
This README is part of the Airbnb Clone Backend SQL Module, designed for deployment readiness.
It emphasizes clean SQL syntax, consistent naming conventions, and cross-database compatibility (MySQL & PostgreSQL).

**Objective:**  
Master SQL joins by writing complex queries using different types of joins.  
These queries are optimized for production-level readability and consistency.

---

## 1. INNER JOIN - Retrieve All Bookings and Their Respective Users
- The INNER JOIN returns only records where there is a match between the bookings and users tables based on the user_id field.

- If a booking is not linked to a user (e.g., due to data inconsistency), it will not appear in the results.

- This is useful for displaying only valid bookings associated with registered users.

Use Case Example:
Displaying a user’s booking history on their profile.


## 2. LEFT JOIN - Retrieve All Properties and Their Reviews (Including Properties with No Reviews)
- The LEFT JOIN retrieves all properties from the properties table,
and any matching reviews from the reviews table.

- Properties without reviews will still appear, but the review fields will be NULL.

- This ensures that every property is shown, even if it hasn’t been reviewed yet.

Use Case Example:
Displaying all listings on the host dashboard, including those awaiting their first review.


## 3.  FULL OUTER JOIN - Retrieve All Users and All Bookings
Note: FULL OUTER JOIN is not supported in MySQL.
If you’re using MySQL, use the UNION alternative shown below.

- This query retrieves all users and all bookings, regardless of whether they’re related or not.

- Users without bookings still appear.

- Bookings without a linked user (due to data issues or deletions) also appear.

- This is ideal for data reconciliation, audits, or admin dashboards.

Use Case Example:
Showing an overview report that includes all users (active or not) and all bookings, even if incomplete.



## Testing with Sample Data

You can test these queries locally with sample tables such as:

-- Sample user

INSERT INTO users (user_id, name, email) VALUES (1, 'Jane Doe', 'jane@example.com');

-- Sample property

INSERT INTO properties (property_id, title, host_id) VALUES (101, 'Cozy Beach House', 1);

-- Sample booking

INSERT INTO bookings (booking_id, property_id, user_id, check_in_date, check_out_date, status)
VALUES (1001, 101, 1, '2025-12-01', '2025-12-07', 'confirmed');

-- Sample review

INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES (5001, 101, 1, 5, 'Amazing experience!', NOW());
