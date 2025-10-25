
-- seed.sql
-- This script populates the AirBnB database with sample data for testing and demonstration purposes.

-- Insert sample Users (mix of guests, hosts, and an admin)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
-- Guest 1
('11111111-aaaa-bbbb-cccc-000000000001', 'Bkay', 'Sasha', 'bkay.sasha@example.com', 'hashed_pwd_1', '+254701111111', 'guest', DEFAULT),

-- Host 1
('11111111-aaaa-bbbb-cccc-000000000002', 'Tim', 'Omondi', 'tim.omondi@example.com', 'hashed_pwd_2', '+254702222222', 'host', DEFAULT),

-- Guest 2
('11111111-aaaa-bbbb-cccc-000000000003', 'Jane', 'Doe', 'jane.doe@example.com', 'hashed_pwd_3', '+254703333333', 'guest', DEFAULT),

-- Guest 3
('11111111-aaaa-bbbb-cccc-000000000004', 'Brian', 'Otieno', 'brian.otieno@example.com', 'hashed_pwd_4', '+254704444444', 'guest', DEFAULT),

-- Host 2
('11111111-aaaa-bbbb-cccc-000000000005', 'Stano', 'Kimani', 'stano.kimani@example.com', 'hashed_pwd_5', '+254705555555', 'host', DEFAULT),

-- Admin
('11111111-aaaa-bbbb-cccc-000000000006', 'John', 'Mwangi', 'john.mwangi@example.com', 'hashed_pwd_6', '+254706666666', 'admin', DEFAULT);



-- Insert sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('22222222-aaaa-bbbb-cccc-000000000001', '11111111-aaaa-bbbb-cccc-000000000002',
 'Beachfront Cottage', 'A cozy cottage by the ocean with 2 bedrooms and Wi-Fi.', 'Diani Beach', 150.00),
('22222222-aaaa-bbbb-cccc-000000000002', '11111111-aaaa-bbbb-cccc-000000000002',
 'City Apartment', 'Modern apartment in the heart of Nairobi with great views.', 'Nairobi CBD', 95.00),
('22222222-aaaa-bbbb-cccc-000000000003', '11111111-aaaa-bbbb-cccc-000000000002',
 'Safari Lodge', 'Luxury lodge located near the Maasai Mara National Reserve.', 'Narok County', 250.00);


-- Insert sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('33333333-aaaa-bbbb-cccc-000000000001', '22222222-aaaa-bbbb-cccc-000000000001',
 '11111111-aaaa-bbbb-cccc-000000000001', '2025-11-01', '2025-11-05', 600.00, 'confirmed'),
('33333333-aaaa-bbbb-cccc-000000000002', '22222222-aaaa-bbbb-cccc-000000000002',
 '11111111-aaaa-bbbb-cccc-000000000003', '2025-12-10', '2025-12-15', 475.00, 'pending'),
('33333333-aaaa-bbbb-cccc-000000000003', '22222222-aaaa-bbbb-cccc-000000000003',
 '11111111-aaaa-bbbb-cccc-000000000001', '2026-01-05', '2026-01-08', 750.00, 'canceled');


-- Insert sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('44444444-aaaa-bbbb-cccc-000000000001', '33333333-aaaa-bbbb-cccc-000000000001', 600.00, 'credit_card'),
('44444444-aaaa-bbbb-cccc-000000000002', '33333333-aaaa-bbbb-cccc-000000000002', 475.00, 'paypal');


-- Insert sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('55555555-aaaa-bbbb-cccc-000000000001', '22222222-aaaa-bbbb-cccc-000000000001',
 '11111111-aaaa-bbbb-cccc-000000000001', 5, 'Amazing stay! Clean, quiet, and right on the beach.'),
('55555555-aaaa-bbbb-cccc-000000000002', '22222222-aaaa-bbbb-cccc-000000000002',
 '11111111-aaaa-bbbb-cccc-000000000003', 4, 'Great apartment, though parking was limited.');


--- Insert sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('66666666-aaaa-bbbb-cccc-000000000001', '11111111-aaaa-bbbb-cccc-000000000001',
 '11111111-aaaa-bbbb-cccc-000000000002', 'Hi David, is the Beachfront Cottage available next weekend?'),
('66666666-aaaa-bbbb-cccc-000000000002', '11111111-aaaa-bbbb-cccc-000000000002',
 '11111111-aaaa-bbbb-cccc-000000000001', 'Hi Bridget! Yes, it’s available. Would you like me to confirm your booking?');
