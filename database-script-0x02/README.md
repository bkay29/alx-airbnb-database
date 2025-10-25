# Sample Data for AirBnB Dtabase 

This step demonstrates how to insert **realistic sample data** into the AirBnB database schema created in the previous step.  

The data helps test relationships, constraints, and overall functionality of the database system.

The purpose of this step is to populate the database and ensure it serves several key goals:
1. **Validation** - ensures the schema supports real-world data without constraint violations.  
2. **Testing** - enables running joins and queries to verify relational logic.  
3. **Demonstration** - provides realistic output when showcasing the database structure or running reports.  
4. **Performance** - allows early observation of how indexes and constraints affect query speed.  


##  **Objective**

To populate all tables with example records that:
- Reflect real-world AirBnB usage.  
- Maintain **referential integrity** between related entities.  
- Allow testing of joins, queries, and reports.  

---

## **Overview**

| Entity | Description | Example Data Added |
|--------|--------------|--------------------|
| **User** | Stores registered platform users (guests, hosts, admins). | 4 sample users with distinct roles. |
| **Property** | Lists homes or spaces hosted on the platform. | 3 sample properties owned by one host. |
| **Booking** | Represents reservations made by guests. | 3 sample bookings showing different statuses. |
| **Payment** | Records financial transactions tied to bookings. | 2 completed payments. |
| **Review** | Captures feedback and ratings from guests. | 2 sample reviews. |
| **Message** | Stores user-to-user communications. | 2 message exchanges between a guest and a host. |

---

## **1. User Data**

Each user record defines:
- A unique `user_id` (UUID)
- Personal details (`first_name`, `last_name`, `email`, `phone_number`)
- A `role` (guest, host, or admin)
- Automatic timestamp on account creation

This ensures all roles needed in the system are represented:
- **Guest** (makes bookings)
- **Host** (owns properties)
- **Admin** (system-level management)

---

## **2. Property Data**

Each property:
- Is owned by a `host_id` referencing the **User** table.  
- Contains details such as name, description, location, and price per night.  
- Represents real-world diversity (e.g., beachfront cottage, city apartment, safari lodge).  

This table helps test **host-to-property** relationships and price calculations.

---

## **3. Booking Data**

Each booking:
- Links a **User** (guest) to a **Property**.  
- Has a start and end date, total price, and booking status.  
- Demonstrates all possible states: `pending`, `confirmed`, `canceled`.  

These entries validate that foreign key relationships and date ranges function properly.

---

##  **4. Payment Data**

Each payment:
- References a valid booking through `booking_id`.  
- Records the payment method (credit card, PayPal, or Stripe).  
- Simulates real transaction flow and total cost verification.  

This ensures **one-to-one linkage** between `Booking` and `Payment` is maintained.

---

## **5. Review Data**

Each review:
- References a property and a user (the guest who booked it).  
- Contains a numeric `rating` (1–5) and a text `comment`.  
- Demonstrates the feedback mechanism typical of the AirBnB platform.  

The rating constraint (`CHECK rating >= 1 AND rating <= 5`) ensures data validity.

---

##  **6. Message Data**

Each message:
- Is a record of communication between users (`sender_id` and `recipient_id`).  
- Contains a message body and timestamp.  
- Simulates typical guest–host chat interactions prior to booking.  

This validates **user-to-user** relationships without redundancy.

---

## **Verification Checklist**

After executing the insert scripts:
-  All users have unique emails and roles.  
- Each property is linked to an existing host.  
-  Bookings belong to real users and properties.  
-  Payments reference valid bookings.  
-  Reviews match real properties and users.  
-  Messages connect two existing users.  

---





