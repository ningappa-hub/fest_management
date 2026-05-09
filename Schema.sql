-- Fest Management Tables

-- Creating Fest Management Database
create database fest_management;

-- Use Fest Management Database
use fest_management;

-- 1. Fest Table
-- Purpose: Stores festival information
CREATE TABLE fest (
	fest_id VARCHAR(5) PRIMARY KEY,
    fest_name VARCHAR(100) UNIQUE NOT NULL,
    year YEAR,
    head_team_id VARCHAR(5) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- 2. Team Table
-- Purpose: Stores team/organizer information
CREATE TABLE team (
	team_id VARCHAR(5) PRIMARY KEY,
    team_name VARCHAR(500) UNIQUE NOT NULL,
    team_type ENUM('ORG', 'MNG') DEFAULT 'ORG',
    fest_id VARCHAR(5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    upadated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (fest_id) REFERENCES fest(fest_id)
);

-- 3. Member Table
-- Purpose: Stores team members with supervision hierarchy
CREATE TABLE member (
	member_id VARCHAR(5) PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    supervisor_member_id VARCHAR(5),
    team_id VARCHAR(5) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (supervisor_member_id) REFERENCES member(member_id),
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

-- 4. Event Table
-- Purpose: Stores event details
CREATE TABLE event (
	event_id VARCHAR(5) PRIMARY KEY,
    event_name VARCHAR(25) NOT NULL,
    building VARCHAR(15),
    floor VARCHAR(10),
    room_number INT,
    price DECIMAL(10, 2) CHECK (price < 1500.00),
    team_id VARCHAR(5) NOT NULL,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    CONSTRAINT chk_room_number CHECK (room_number >= 100 AND room_number <= 999)
);

-- 5. Event_Conduction Table
-- Purpose: Tracks when events are conducted (supports multiple dates for same event)
CREATE TABLE event_conduction (
	event_id VARCHAR(5),
    date_of_conduction DATE,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (event_id, date_of_conduction),
    FOREIGN KEY (event_id) REFERENCES event(event_id)
);

-- 6. participent Table
-- Purpose: Stores student participant information
CREATE TABLE Participant (
    SRN VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(20),
    Semester INT,
    Gender ENUM('Male', 'Female', 'Other', 'Prefer not to say'),
    CONSTRAINT chk_semester CHECK (Semester >= 1 AND Semester <= 8)
);

-- 7. VISITOR Table
-- Purpose: Stores visitor information (linked to participants)
CREATE TABLE Visitor (
    SRN VARCHAR(10),
    Name VARCHAR(25) NOT NULL,
    Age INT,
    Gender ENUM('Male', 'Female', 'Other', 'Prefer not to say'),
    PRIMARY KEY (SRN, Name),
    FOREIGN KEY (SRN) REFERENCES Participant(SRN) ON DELETE CASCADE,
    CONSTRAINT chk_age CHECK (Age >= 0 AND Age <= 120)
);

-- 8. REGISTRATION Table
-- Purpose: Tracks event registrations
CREATE TABLE Registration (
    Event_ID VARCHAR(5),
    SRN VARCHAR(10),
    Registration_ID VARCHAR(5) NOT NULL UNIQUE,
    PRIMARY KEY (Event_ID, SRN),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (SRN) REFERENCES Participant(SRN)
);

-- 9. STALL Table
-- Purpose: Stores stall/food stall information
CREATE TABLE Stall (
    Stall_ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(25) UNIQUE NOT NULL,
    Fest_ID VARCHAR(5) NOT NULL,
    FOREIGN KEY (Fest_ID) REFERENCES Fest(Fest_ID)
);

-- 10. ITEM Table
-- Purpose: Stores item/food item catalog
CREATE TABLE Item (
    Item_ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type ENUM('Veg', 'Non-Veg') NOT NULL
);

-- 11. STALL_ITEMS Table
-- Purpose: Junction table linking stalls to items with pricing
CREATE TABLE Stall_Items (
    Stall_ID VARCHAR(5),
    Item_ID VARCHAR(5),
    Price_Per_Unit DECIMAL(10,2) DEFAULT 50 NOT NULL,
    Total_Quantity INT CHECK (Total_Quantity <= 1000),
    PRIMARY KEY (Stall_ID, Item_ID),
    FOREIGN KEY (Stall_ID) REFERENCES Stall(Stall_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);

-- 12. PURCHASED Table
-- Purpose: Tracks purchases made by participants
CREATE TABLE Purchased (
    SRN VARCHAR(10),
    Stall_ID VARCHAR(5),
    Item_ID VARCHAR(5),
    Timestamp TIMESTAMP,
    Quantity INT NOT NULL,
    PRIMARY KEY (SRN, Stall_ID, Item_ID, Timestamp),
    FOREIGN KEY (SRN) REFERENCES Participant(SRN),
    FOREIGN KEY (Stall_ID) REFERENCES Stall(Stall_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);