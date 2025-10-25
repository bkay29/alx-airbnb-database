
## **Design Database SQL Schema (DDL)**



This section contains the SQL statements required to create the AirBnB database schema based strictly on the provided specifications.  

All tables include proper primary keys, foreign keys, constraints, and indexes to ensure data integrity and performance.

---

#  SQL Queries to Define the Database Schema

This step translates the AirBnB database design into SQL statements for creating the schema.  
It ensures each entity (table) and relationship follows the design rules, constraints, and normalization principles up to **Third Normal Form (3NF)**.

---

## **Objective**

To create all database tables with proper:
- Data types  
- Primary and foreign key constraints  
- Unique and not-null constraints  
- ENUM fields for controlled data  
- Indexes for optimized performance  

---

## **Overview of Entities**

| Entity | Description |
|--------|--------------|
| **User** | Stores all user accounts (guests, hosts, admins). |
| **Property** | Contains property listings managed by hosts. |
| **Booking** | Represents reservations made by users for properties. |
| **Payment** | Tracks payments linked to bookings. |
| **Review** | Holds user reviews and ratings for properties. |
| **Message** | Stores direct messages between users. |

---

