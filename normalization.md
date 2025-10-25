
## Overview
The main objective here is to ensure the AirBnB database design eliminates redundancy, maintains data integrity, and achieves **Third Normal Form (3NF)**   

This document explains the normalization process applied to the AirBnB Database design to ensure that it adheres to the Third Normal Form (3NF) in these three key stages:
- 1NF – Eliminates repeating groups and ensures atomicity.
- 2NF – Ensures full functional dependency (Removes partial dependencies on composite primary keys.)
- 3NF – Removes transitive dependencies and ensuring that non-key attributes depend only on the primary key.


---

###  **Step 1: First Normal Form (1NF)**
**Rule:**  
Each table must have atomic (indivisible) values, and each record must be unique.

**Compliance:**  
- All attributes contain single values (no repeating groups).  
- Each table has a **Primary Key** ensuring record uniqueness.  
✅ *Schema meets 1NF.*

---

###  **Step 2: Second Normal Form (2NF)**
**Rule:**  
All non-key attributes must depend on the **entire primary key**, not part of it (applies to tables with composite keys).

**Compliance:**  
- Every table uses a **single-column primary key (UUID)**, not a composite key.  
- All non-key attributes depend fully on their table’s primary key.  
✅ *Schema meets 2NF.*

---

### **Step 3: Third Normal Form (3NF)**
**Rule:**  
No **transitive dependencies** -  non-key attributes should depend only on the primary key, not on other non-key attributes.

**Verification per Entity:**

| Table | Check | Result |
|--------|--------|--------|
| **User** | All attributes depend only on `user_id`. No transitive dependency. | ✅ |
| **Property** | Depends only on `property_id`. `host_id` is a valid foreign key, not a derived attribute. | ✅ |
| **Booking** | Depends only on `booking_id`. `total_price` is derived but valid (calculated, not stored dependency). | ✅ |
| **Payment** | All fields depend only on `payment_id`. `booking_id` is an external FK, not a transitive link. | ✅ |
| **Review** | Depends only on `review_id`. No indirect dependencies. | ✅ |
| **Message** | Depends only on `message_id`. No redundant or derived fields. | ✅ |

✅ *Schema satisfies 3NF.*

---



