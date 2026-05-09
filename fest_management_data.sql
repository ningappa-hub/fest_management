-- Fest Management Database Tables
-- 1. Inserting Data into FEST Table

-- 1. Insert festival data
INSERT INTO Fest (Fest_ID, Fest_Name, Year, Head_Team_ID) VALUES
('F001', 'Tech Fest', 2024, NULL),  -- Head team will be set later
('F002', 'Cultural Fest', 2024, NULL),
('F003', 'Sports Fest', 2024, NULL),
('F004', 'Music Fest', 2023, NULL),
('F005', 'Literary Fest', 2023, NULL);

-- 2. Inserting Data into TEAM Table
-- Insert team data (org teams for each fest and some management teams)
INSERT INTO Team (Team_ID, Team_Name, Team_Type, Fest_ID) VALUES
-- Tech Fest Teams (F001)
('T001', 'Tech Core Committee', 'ORG', 'F001'),
('T002', 'Programming Team', 'ORG', 'F001'),
('T003', 'Robotics Team', 'ORG', 'F001'),
('T004', 'Web Dev Team', 'ORG', 'F001'),

-- Cultural Fest Teams (F002)
('T005', 'Cultural Core Committee', 'ORG', 'F002'),
('T006', 'Dance Team', 'ORG', 'F002'),
('T007', 'Music Team', 'ORG', 'F002'),
('T008', 'Drama Team', 'ORG', 'F002'),

-- Sports Fest Teams (F003)
('T009', 'Sports Core Committee', 'ORG', 'F003'),
('T010', 'Cricket Team', 'ORG', 'F003'),
('T011', 'Football Team', 'ORG', 'F003'),
('T012', 'Badminton Team', 'ORG', 'F003'),

-- Music Fest Teams (F004)
('T013', 'Music Fest Organizers', 'ORG', 'F004'),

-- Literary Fest Teams (F005)
('T014', 'Literary Fest Organizers', 'ORG', 'F005'),

-- Management Teams (No specific fest - can work across fests)
('T101', 'Finance Team', 'MNG', NULL),
('T102', 'Logistics Team', 'MNG', NULL),
('T103', 'Marketing Team', 'MNG', NULL),
('T104', 'Sponsorship Team', 'MNG', NULL);


-- Insert member data with team assignments and supervisor hierarchy
INSERT INTO Member (Member_ID, Member_Name, Date_of_Birth, Supervisor_Member_ID, Team_ID) VALUES
-- Tech Core Committee (T001) - Leadership
('M001', 'Rahul Sharma', '2000-05-15', NULL, 'T001'),          -- Team Lead (no supervisor)
('M002', 'Priya Patel', '2001-03-22', 'M001', 'T001'),         -- Reports to Rahul
('M003', 'Amit Kumar', '2000-11-08', 'M001', 'T001'),          -- Reports to Rahul

-- Programming Team (T002)
('M004', 'Sneha Reddy', '2002-01-30', 'M002', 'T002'),         -- Reports to Priya
('M005', 'Vikram Singh', '2001-07-14', 'M002', 'T002'),        -- Reports to Priya
('M006', 'Ananya Desai', '2002-09-18', 'M002', 'T002'),        -- Reports to Priya

-- Robotics Team (T003)
('M007', 'Karthik Nair', '2000-12-05', 'M003', 'T003'),        -- Reports to Amit
('M008', 'Pooja Mehta', '2001-04-25', 'M003', 'T003'),         -- Reports to Amit

-- Web Dev Team (T004)
('M009', 'Rohit Verma', '2002-02-28', 'M003', 'T004'),         -- Reports to Amit
('M010', 'Neha Gupta', '2001-08-12', 'M003', 'T004'),          -- Reports to Amit

-- Cultural Core Committee (T005)
('M011', 'Sanjay Joshi', '2000-06-20', NULL, 'T005'),          -- Team Lead
('M012', 'Meera Iyer', '2001-02-14', 'M011', 'T005'),          -- Reports to Sanjay

-- Dance Team (T006)
('M013', 'Divya Rani', '2002-03-30', 'M012', 'T006'),          -- Reports to Meera
('M014', 'Arjun Kapoor', '2001-11-11', 'M012', 'T006'),        -- Reports to Meera

-- Music Team (T007)
('M015', 'Sunita Rao', '2000-09-09', 'M012', 'T007'),          -- Reports to Meera

-- Sports Core Committee (T009)
('M016', 'Rajesh Yadav', '2000-04-10', NULL, 'T009'),          -- Team Lead
('M017', 'Swati Das', '2001-12-25', 'M016', 'T009'),           -- Reports to Rajesh

-- Management Teams
('M101', 'Arun Malhotra', '1999-08-15', NULL, 'T101'),         -- Finance Lead
('M102', 'Deepika Chawla', '2000-03-03', 'M101', 'T101'),      -- Finance Team
('M103', 'Manish Thakur', '1999-11-30', NULL, 'T102'),         -- Logistics Lead
('M104', 'Sonali Banerjee', '2001-01-20', 'M103', 'T102');     -- Logistics Team


-- Insert event data with team assignments
INSERT INTO Event (Event_ID, Event_Name, Building, Floor, Room_Number, Price, Team_ID) VALUES
-- Tech Fest Events
('E001', 'Code Marathon', 'Tech Block', '2nd', 201, 300.00, 'T002'),
('E002', 'Robo Wars', 'Robotics Lab', '1st', 101, 500.00, 'T003'),
('E003', 'Web Design Hack', 'CS Dept', '3rd', 305, 400.00, 'T004'),
('E004', 'AI Workshop', 'Seminar Hall', 'Ground', 101, 800.00, 'T001'),
('E005', 'Debugging Challenge', 'Lab 3', '2nd', 210, 250.00, 'T002'),

-- Cultural Fest
('E006', 'Dance Competition', 'Auditorium', 'Ground', 100, 600.00, 'T006'),
('E007', 'Solo Singing', 'Music Room', '1st', 110, 400.00, 'T007'),
('E008', 'Street Play', 'Open Arena', 'Outdoor', 199, 200.00, 'T008'),
('E009', 'Fashion Show', 'Auditorium', 'Ground', 100, 700.00, 'T006'),

-- Sports Fest
('E010', 'Cricket Tournament', 'Sports Ground', 'Outdoor', 200, 1000.00, 'T010'),
('E011', 'Football Match', 'Football Field', 'Outdoor', 201, 800.00, 'T011'),
('E012', 'Badminton Singles', 'Indoor Stadium', '1st', 150, 300.00, 'T012'),

-- Music Fest
('E013', 'Band Performance', 'Main Stage', 'Outdoor', 300, 1200.00, 'T013'),
('E014', 'Karaoke Night', 'Pub', 'Basement', 150, 150.00, 'T013'),

-- Literary Fest
('E015', 'Debate Competition', 'Lecture Hall', '2nd', 202, 350.00, 'T014'),
('E016', 'Poetry Slam', 'Library', '1st', 105, 100.00, 'T014'),

-- Free Events
('E017', 'Guest Lecture', 'Seminar Hall', 'Ground', 102, 0.00, 'T103'),
('E018', 'Sponsor Meet', 'Conference Room', '4th', 401, 0.00, 'T104');

-- Insert participant data (students)
INSERT INTO Participant (SRN, Name, Department, Semester, Gender) VALUES
-- Computer Science Students
('PES1CS001', 'Arjun Sharma', 'Computer Science', 3, 'Male'),
('PES1CS002', 'Priya Nair', 'Computer Science', 5, 'Female'),
('PES1CS003', 'Rahul Verma', 'Computer Science', 3, 'Male'),
('PES1CS004', 'Sneha Reddy', 'Computer Science', 7, 'Female'),
('PES1CS005', 'Karthik Kumar', 'Computer Science', 5, 'Male'),

-- Electronics Students
('PES1EC001', 'Ananya Desai', 'Electronics', 4, 'Female'),
('PES1EC002', 'Vikram Singh', 'Electronics', 6, 'Male'),
('PES1EC003', 'Meera Patel', 'Electronics', 4, 'Female'),
('PES1EC004', 'Rajesh Yadav', 'Electronics', 8, 'Male'),
('PES1EC005', 'Sunita Rao', 'Electronics', 6, 'Female'),

-- Mechanical Students
('PES1ME001', 'Amit Joshi', 'Mechanical', 3, 'Male'),
('PES1ME002', 'Divya Gupta', 'Mechanical', 5, 'Female'),
('PES1ME003', 'Sanjay Kapoor', 'Mechanical', 3, 'Male'),
('PES1ME004', 'Pooja Chawla', 'Mechanical', 7, 'Female'),
('PES1ME005', 'Manish Thakur', 'Mechanical', 5, 'Male'),

-- Civil Students
('PES1CV001', 'Rohit Malhotra', 'Civil', 2, 'Male'),
('PES1CV002', 'Neha Banerjee', 'Civil', 4, 'Female'),
('PES1CV003', 'Arun Iyer', 'Civil', 2, 'Male'),
('PES1CV004', 'Swati Das', 'Civil', 6, 'Female'),
('PES1CV005', 'Suresh Nair', 'Civil', 4, 'Male'),

-- MBA Students
('PES1MBA01', 'Deepika Mehta', 'MBA', 1, 'Female'),
('PES1MBA02', 'Ravi Shastri', 'MBA', 3, 'Male'),
('PES1MBA03', 'Anjali Chatterjee', 'MBA', 1, 'Female'),
('PES1MBA04', 'Kunal Bose', 'MBA', 3, 'Male'),
('PES1MBA05', 'Shreya Sen', 'MBA', 1, 'Female'),

-- External Participants (different college)
('EXT001', 'Ajay Saxena', 'Computer Science', 6, 'Male'),
('EXT002', 'Bhavana Mishra', 'Electronics', 4, 'Female'),
('EXT003', 'Chetan Agarwal', 'Mechanical', 5, 'Male'),
('EXT004', 'Dipika Roy', 'Civil', 3, 'Female');

-- Insert visitor data (visitors accompanying participants)
INSERT INTO Visitor (SRN, Name, Age, Gender) VALUES
-- Visitors for PES1CS001 (Arjun Sharma)
('PES1CS001', 'Ravi Sharma', 45, 'Male'),   -- Father
('PES1CS001', 'Anita Sharma', 42, 'Female'), -- Mother

-- Visitors for PES1CS002 (Priya Nair)
('PES1CS002', 'Sunil Nair', 48, 'Male'),     -- Father

-- Visitors for PES1EC001 (Ananya Desai)
('PES1EC001', 'Raj Desai', 50, 'Male'),      -- Father
('PES1EC001', 'Mona Desai', 47, 'Female'),   -- Mother
('PES1EC001', 'Rohan Desai', 20, 'Male'),    -- Brother

-- Visitors for PES1ME001 (Amit Joshi)
('PES1ME001', 'Geeta Joshi', 43, 'Female'),  -- Mother

-- External participant's visitors
('EXT001', 'Vikram Saxena', 22, 'Male'),     -- Friend
('EXT002', 'Priyanka Gupta', 21, 'Female'),  -- Friend

-- Standalone visitors (not linked to participants - if allowed by schema)
('PES1MBA01', 'Rohan Kapoor', 23, 'Male');   -- Friend


-- Insert registration data (participants registering for events)
INSERT INTO Registration (Event_ID, SRN, Registration_ID) VALUES
-- Tech Fest Registrations
('E001', 'PES1CS001', 'R001'),  -- Arjun registers for Code Marathon
('E001', 'PES1CS002', 'R002'),  -- Priya registers for Code Marathon
('E001', 'PES1CS003', 'R003'),  -- Rahul registers for Code Marathon
('E001', 'PES1EC001', 'R004'),  -- Ananya registers for Code Marathon (different dept)
('E001', 'EXT001', 'R005'),     -- External student registers for Code Marathon

('E002', 'PES1CS004', 'R006'),  -- Sneha registers for Robo Wars
('E002', 'PES1EC002', 'R007'),  -- Vikram registers for Robo Wars
('E002', 'EXT003', 'R008'),     -- External registers for Robo Wars

('E003', 'PES1CS001', 'R009'),  -- Arjun registers for Web Design Hack
('E003', 'PES1CS005', 'R010'),  -- Karthik registers for Web Design Hack

('E004', 'PES1CS002', 'R011'),  -- Priya registers for AI Workshop
('E004', 'PES1EC003', 'R012'),  -- Meera registers for AI Workshop
('E004', 'PES1MBA01', 'R013'),  -- Deepika registers for AI Workshop

('E005', 'PES1CS003', 'R014'),  -- Rahul registers for Debugging Challenge
('E005', 'PES1CS004', 'R015'),  -- Sneha registers for Debugging Challenge

-- Cultural Fest Registrations
('E006', 'PES1CV002', 'R016'),  -- Neha registers for Dance Competition
('E006', 'PES1MBA02', 'R017'),  -- Ravi registers for Dance Competition
('E006', 'PES1MBA05', 'R018'),  -- Shreya registers for Dance Competition

('E007', 'PES1EC004', 'R019'),  -- Rajesh registers for Solo Singing
('E007', 'PES1CV004', 'R020'),  -- Swati registers for Solo Singing

('E008', 'PES1ME003', 'R021'),  -- Sanjay registers for Street Play
('E008', 'PES1ME004', 'R022'),  -- Pooja registers for Street Play
('E008', 'PES1CV005', 'R023'),  -- Suresh registers for Street Play

('E009', 'PES1MBA03', 'R024'),  -- Anjali registers for Fashion Show
('E009', 'PES1MBA04', 'R025'),  -- Kunal registers for Fashion Show

-- Sports Fest Registrations
('E010', 'PES1ME001', 'R026'),  -- Amit registers for Cricket Tournament
('E010', 'PES1ME002', 'R027'),  -- Divya registers for Cricket Tournament
('E010', 'PES1ME005', 'R028'),  -- Manish registers for Cricket Tournament

('E011', 'PES1CV001', 'R029'),  -- Rohit registers for Football Match
('E011', 'PES1CV003', 'R030'),  -- Arun registers for Football Match

('E012', 'PES1EC005', 'R031'),  -- Sunita registers for Badminton Singles
('E012', 'EXT004', 'R032'),     -- External registers for Badminton Singles

-- Music Fest Registrations (past events)
('E013', 'PES1CS005', 'R033'),  -- Karthik registered for Band Performance
('E013', 'PES1EC001', 'R034'),  -- Ananya registered for Band Performance

('E014', 'PES1CV002', 'R035'),  -- Neha registered for Karaoke Night

-- Literary Fest Registrations (past events)
('E015', 'PES1MBA01', 'R036'),  -- Deepika registered for Debate Competition
('E015', 'EXT002', 'R037'),     -- External registered for Debate Competition

('E016', 'PES1CS002', 'R038'),  -- Priya registered for Poetry Slam
('E016', 'PES1EC002', 'R039'),  -- Vikram registered for Poetry Slam

-- Free Events (more registrations expected)
('E017', 'PES1CS001', 'R040'),  -- Arjun registers for Guest Lecture
('E017', 'PES1CS002', 'R041'),  -- Priya registers for Guest Lecture
('E017', 'PES1CS003', 'R042'),  -- Rahul registers for Guest Lecture
('E017', 'PES1CS004', 'R043'),  -- Sneha registers for Guest Lecture
('E017', 'PES1CS005', 'R044'),  -- Karthik registers for Guest Lecture

('E018', 'PES1MBA02', 'R045'),  -- Ravi registers for Sponsor Meet
('E018', 'PES1MBA03', 'R046');  -- Anjali registers for Sponsor Meet


-- Insert stall data (food and merchandise stalls for each fest)
INSERT INTO Stall (Stall_ID, Name, Fest_ID) VALUES
-- Tech Fest Stalls (F001)
('S001', 'Tech Cafe', 'F001'),
('S002', 'Gadget Store', 'F001'),
('S003', 'Book Corner', 'F001'),
('S004', 'Snack Bar', 'F001'),

-- Cultural Fest Stalls (F002)
('S005', 'Food Court', 'F002'),
('S006', 'Art & Craft', 'F002'),
('S007', 'Henna Corner', 'F002'),
('S008', 'Traditional Wear', 'F002'),

-- Sports Fest Stalls (F003)
('S009', 'Energy Drinks', 'F003'),
('S010', 'Sports Gear', 'F003'),
('S011', 'Refreshments', 'F003'),

-- Music Fest Stalls (F004)
('S012', 'Music Merch', 'F004'),
('S013', 'Food Trucks', 'F004'),
('S014', 'Beverage Bar', 'F004'),

-- Literary Fest Stalls (F005)
('S015', 'Book Store', 'F005'),
('S016', 'Coffee Shop', 'F005'),
('S017', 'Stationery', 'F005'),

-- Common Stalls (available in all fests - assign to Tech Fest as default)
('S018', 'Water Station', 'F001'),
('S019', 'First Aid', 'F001'),
('S020', 'Information Desk', 'F001');

-- Insert item data (catalog of items available at stalls)
INSERT INTO Item (Item_ID, Name, Type) VALUES
-- Food Items (Veg)
('IT001', 'Burger', 'Veg'),
('IT002', 'Pizza Slice', 'Veg'),
('IT003', 'French Fries', 'Veg'),
('IT004', 'Sandwich', 'Veg'),
('IT005', 'Pasta', 'Veg'),
('IT006', 'Salad', 'Veg'),
('IT007', 'Ice Cream', 'Veg'),
('IT008', 'Soft Drink', 'Veg'),
('IT009', 'Coffee', 'Veg'),
('IT010', 'Tea', 'Veg'),
('IT011', 'Juice', 'Veg'),
('IT012', 'Water Bottle', 'Veg'),
('IT013', 'Cake Slice', 'Veg'),
('IT014', 'Cookies', 'Veg'),
('IT015', 'Chocolate', 'Veg'),

-- Food Items (Non-Veg)
('IT016', 'Chicken Burger', 'Non-Veg'),
('IT017', 'Chicken Pizza', 'Non-Veg'),
('IT018', 'Chicken Wings', 'Non-Veg'),
('IT019', 'Egg Sandwich', 'Non-Veg'),
('IT020', 'Fish Fry', 'Non-Veg'),

-- Non-Food Items
('IT021', 'T-Shirt', 'Veg'),      -- Type doesn't matter for non-food, using 'Veg' as default
('IT022', 'Cap', 'Veg'),
('IT023', 'Book', 'Veg'),
('IT024', 'Pen', 'Veg'),
('IT025', 'Notebook', 'Veg'),
('IT026', 'Keychain', 'Veg'),
('IT027', 'Poster', 'Veg'),
('IT028', 'Badge', 'Veg'),
('IT029', 'Stickers', 'Veg'),
('IT030', 'Bag', 'Veg');

-- Insert stall items data (which items are available at which stalls)
INSERT INTO Stall_Items (Stall_ID, Item_ID, Price_Per_Unit, Total_Quantity) VALUES
-- Tech Cafe (S001) - Food items
('S001', 'IT001', 80.00, 100),   -- Burger
('S001', 'IT002', 60.00, 150),   -- Pizza Slice
('S001', 'IT003', 50.00, 200),   -- French Fries
('S001', 'IT008', 40.00, 300),   -- Soft Drink
('S001', 'IT009', 30.00, 250),   -- Coffee

-- Gadget Store (S002) - Electronics and accessories
('S002', 'IT021', 300.00, 50),   -- T-Shirt
('S002', 'IT022', 150.00, 100),  -- Cap
('S002', 'IT026', 50.00, 200),   -- Keychain
('S002', 'IT027', 100.00, 80),   -- Poster
('S002', 'IT029', 20.00, 300),   -- Stickers

-- Book Corner (S003)
('S003', 'IT023', 250.00, 30),   -- Book
('S003', 'IT024', 10.00, 500),   -- Pen
('S003', 'IT025', 50.00, 200),   -- Notebook
('S003', 'IT028', 15.00, 400),   -- Badge

-- Snack Bar (S004)
('S004', 'IT004', 70.00, 120),   -- Sandwich
('S004', 'IT007', 40.00, 150),   -- Ice Cream
('S004', 'IT014', 10.00, 500),   -- Cookies
('S004', 'IT015', 20.00, 300),   -- Chocolate
('S004', 'IT011', 35.00, 200),   -- Juice

-- Food Court (S005) - Cultural Fest
('S005', 'IT016', 120.00, 80),   -- Chicken Burger
('S005', 'IT017', 90.00, 100),   -- Chicken Pizza
('S005', 'IT018', 150.00, 60),   -- Chicken Wings
('S005', 'IT019', 60.00, 120),   -- Egg Sandwich
('S005', 'IT020', 180.00, 40),   -- Fish Fry

-- Art & Craft (S006)
('S006', 'IT030', 400.00, 20),   -- Bag
('S006', 'IT027', 120.00, 60),   -- Poster (different price)
('S006', 'IT029', 25.00, 250),   -- Stickers

-- Energy Drinks (S009) - Sports Fest
('S009', 'IT008', 50.00, 200),   -- Soft Drink (higher price at sports)
('S009', 'IT011', 50.00, 150),   -- Juice
('S009', 'IT012', 20.00, 500),   -- Water Bottle

-- Sports Gear (S010)
('S010', 'IT021', 350.00, 30),   -- T-Shirt (sports edition)
('S010', 'IT022', 200.00, 50),   -- Cap (sports edition)

-- Music Merch (S012)
('S012', 'IT021', 400.00, 40),   -- Band T-Shirt
('S012', 'IT022', 180.00, 60),   -- Band Cap
('S012', 'IT027', 150.00, 70),   -- Band Poster

-- Book Store (S015) - Literary Fest
('S015', 'IT023', 200.00, 50),   -- Book (discounted)
('S015', 'IT024', 8.00, 600),    -- Pen (cheaper)
('S015', 'IT025', 40.00, 300),   -- Notebook

-- Coffee Shop (S016)
('S016', 'IT009', 40.00, 200),   -- Coffee (premium)
('S016', 'IT010', 20.00, 300),   -- Tea
('S016', 'IT013', 60.00, 100),   -- Cake Slice
('S016', 'IT014', 15.00, 400);   -- Cookies


-- Insert purchase data (participants buying items from stalls)
INSERT INTO Purchased (SRN, Stall_ID, Item_ID, Timestamp, Quantity) VALUES
-- Day 1: Tech Fest (March 9, 2024)
('PES1CS001', 'S001', 'IT001', '2024-03-09 12:30:00', 2),  -- Arjun buys 2 Burgers
('PES1CS001', 'S001', 'IT008', '2024-03-09 12:31:00', 1),  -- Arjun buys 1 Soft Drink
('PES1CS002', 'S001', 'IT002', '2024-03-09 13:15:00', 1),  -- Priya buys Pizza Slice
('PES1CS002', 'S001', 'IT009', '2024-03-09 13:16:00', 1),  -- Priya buys Coffee

-- Day 1: Merchandise purchases
('PES1CS003', 'S002', 'IT021', '2024-03-09 14:20:00', 1),  -- Rahul buys T-Shirt
('PES1CS003', 'S002', 'IT026', '2024-03-09 14:21:00', 2),  -- Rahul buys 2 Keychains
('PES1EC001', 'S003', 'IT024', '2024-03-09 15:45:00', 5),  -- Ananya buys 5 Pens
('PES1EC001', 'S003', 'IT025', '2024-03-09 15:46:00', 2),  -- Ananya buys 2 Notebooks

-- Day 2: Tech Fest (March 10, 2024)
('PES1CS004', 'S001', 'IT003', '2024-03-10 11:00:00', 1),  -- Sneha buys French Fries
('PES1CS004', 'S004', 'IT007', '2024-03-10 11:30:00', 1),  -- Sneha buys Ice Cream
('PES1CS005', 'S004', 'IT015', '2024-03-10 12:00:00', 3),  -- Karthik buys 3 Chocolates
('PES1CS005', 'S004', 'IT011', '2024-03-10 12:01:00', 2),  -- Karthik buys 2 Juices

-- Cultural Fest Purchases (April 15, 2024)
('PES1CV002', 'S005', 'IT016', '2024-04-15 17:30:00', 1),  -- Neha buys Chicken Burger
('PES1CV002', 'S005', 'IT008', '2024-04-15 17:31:00', 1),  -- Neha buys Soft Drink
('PES1MBA02', 'S006', 'IT030', '2024-04-15 18:45:00', 1),  -- Ravi buys Bag
('PES1MBA05', 'S007', 'IT029', '2024-04-15 19:20:00', 10), -- Shreya buys 10 Stickers

-- Sports Fest Purchases (February 20, 2024)
('PES1ME001', 'S009', 'IT012', '2024-02-20 10:00:00', 3),  -- Amit buys 3 Water Bottles
('PES1ME002', 'S009', 'IT011', '2024-02-20 10:30:00', 2),  -- Divya buys 2 Juices
('PES1ME005', 'S010', 'IT021', '2024-02-20 11:15:00', 1),  -- Manish buys Sports T-Shirt
('PES1ME005', 'S010', 'IT022', '2024-02-20 11:16:00', 1),  -- Manish buys Sports Cap

-- Multiple purchases by same participant
('PES1CS001', 'S002', 'IT022', '2024-03-10 16:00:00', 1),  -- Arjun buys Cap
('PES1CS001', 'S003', 'IT023', '2024-03-11 10:00:00', 1),  -- Arjun buys Book
('PES1CS002', 'S004', 'IT014', '2024-03-10 14:00:00', 5),  -- Priya buys 5 Cookies
('PES1CS002', 'S001', 'IT009', '2024-03-11 15:00:00', 1),  -- Priya buys Coffee again

-- External participants purchases
('EXT001', 'S001', 'IT001', '2024-03-10 13:00:00', 1),     -- External buys Burger
('EXT001', 'S001', 'IT003', '2024-03-10 13:01:00', 1),     -- External buys French Fries
('EXT002', 'S005', 'IT017', '2024-04-16 19:00:00', 2),     -- External buys 2 Chicken Pizzas
('EXT003', 'S009', 'IT008', '2024-02-21 09:00:00', 4),     -- External buys 4 Soft Drinks

-- Literary Fest purchases (past - 2023)
('PES1MBA01', 'S015', 'IT023', '2023-09-15 14:30:00', 2),  -- Deepika buys 2 Books
('PES1MBA01', 'S016', 'IT009', '2023-09-15 15:00:00', 1),  -- Deepika buys Coffee
('EXT002', 'S015', 'IT024', '2023-09-16 16:00:00', 10),    -- External buys 10 Pens

-- Music Fest purchases (past - 2023)
('PES1CS005', 'S012', 'IT021', '2023-10-05 20:30:00', 1),  -- Karthik buys Band T-Shirt
('PES1EC001', 'S012', 'IT027', '2023-10-05 21:00:00', 1);  -- Ananya buys Band Poster


INSERT INTO Event_Conduction (Event_ID, Date_of_Conduction, Start_Time, End_Time) VALUES
-- Tech Fest (F001)
('E001', '2024-03-09', '10:00:00', '13:00:00'),
('E001', '2024-03-10', '10:00:00', '13:00:00'),
('E002', '2024-03-09', '14:00:00', '17:00:00'),
('E003', '2024-03-09', '11:00:00', '14:00:00'),
('E004', '2024-03-10', '09:00:00', '12:00:00'),
('E005', '2024-03-10', '13:00:00', '16:00:00'),

-- Cultural Fest (F002)
('E006', '2024-04-15', '16:00:00', '18:00:00'),
('E007', '2024-04-15', '14:00:00', '16:00:00'),
('E008', '2024-04-15', '17:00:00', '19:00:00'),
('E009', '2024-04-15', '18:00:00', '21:00:00'),

-- Sports Fest (F003)
('E010', '2024-02-20', '09:00:00', '17:00:00'),
('E011', '2024-02-20', '10:00:00', '18:00:00'),
('E012', '2024-02-21', '09:00:00', '15:00:00'),

-- Music Fest (F004 - Past)
('E013', '2023-10-05', '19:00:00', '22:00:00'),
('E014', '2023-10-05', '17:00:00', '19:00:00'),

-- Literary Fest (F005 - Past)
('E015', '2023-09-15', '10:00:00', '13:00:00'),
('E016', '2023-09-16', '11:00:00', '14:00:00'),

-- Common Events
('E017', '2024-03-09', '15:00:00', '17:00:00'),
('E018', '2024-03-10', '11:00:00', '13:00:00');

INSERT INTO Stall_Items (Stall_ID, Item_ID, Price_Per_Unit, Total_Quantity) VALUES
-- Henna Corner (S007)
('S007', 'IT029', 30.00, 200),

-- Traditional Wear (S008)
('S008', 'IT021', 500.00, 50),
('S008', 'IT022', 250.00, 80),

-- Refreshments (S011)
('S011', 'IT008', 40.00, 300),
('S011', 'IT011', 35.00, 250),

-- Food Trucks (S013)
('S013', 'IT001', 100.00, 150),
('S013', 'IT002', 80.00, 150),

-- Beverage Bar (S014)
('S014', 'IT008', 60.00, 200),
('S014', 'IT011', 50.00, 200),

-- Stationery (S017)
('S017', 'IT024', 10.00, 500),
('S017', 'IT025', 50.00, 300),

-- Water Station (S018)
('S018', 'IT012', 10.00, 1000),

-- First Aid (S019)
('S019', 'IT012', 0.00, 500),

-- Information Desk (S020)
('S020', 'IT029', 0.00, 100);
