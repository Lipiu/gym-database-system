--1. Constructing the database tables
CREATE TABLE "MEMBERS_OF_GYM" (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    DateOfBirth DATE,
    SubscriptionID INT,
    JOIN_DATE DATE DEFAULT SYSDATE
);

CREATE TABLE "TRAINERS" (
    TrainerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Specialization VARCHAR(50),
    HireDate DATE DEFAULT SYSDATE
);

CREATE TABLE "TRAINING_SESSION" (
    TrainingSessionID INT PRIMARY KEY,
    TrainingSessionName VARCHAR(50),
    TrainerID INT,
    Schedule TIMESTAMP,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

CREATE TABLE TRAINING_SESSION_MEMBERS (
    TrainingSessionID INT,
    MemberID INT,
    PRIMARY KEY (TrainingSessionID, MemberID),
    FOREIGN KEY (TrainingSessionID) REFERENCES TRAINING_SESSION(TrainingSessionID),
    FOREIGN KEY (MemberID) REFERENCES MEMBERS_OF_GYM(MemberID)
);

CREATE TABLE "EQUIPMENT" (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(50)
);

CREATE TABLE "SUBSCRIPTION" (
    SubscriptionID INT PRIMARY KEY,
    PlanName VARCHAR(50),
    Cost DECIMAL(5, 2), --for 5 digits with 2 digits after decimal point
    DurationMonths INT
);

CREATE TABLE PAYMENTS (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    SubscriptionID INT,
    Amount DECIMAL(6, 2),
    PaymentDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (MemberID) REFERENCES MEMBERS_OF_GYM(MemberID),
    FOREIGN KEY (SubscriptionID) REFERENCES SUBSCRIPTION(SubscriptionID)
);

ALTER TABLE MEMBERS_OF_GYM ADD Address VARCHAR(255);
DROP TABLE EQUIPMENT;

--2. Using DML Statements
--inserting members of the gym
INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (1, 'John Doe', 'john.doe@gmail.com', '1234567890', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 101);
INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (2, 'Mike Johnson', 'mike.johnson@gmail.com', '0987654321', TO_DATE('1995-07-20', 'YYYY-MM-DD'), 102);
INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (3, 'Alice Matthews', 'alicematthwes@gmail.com', '1234098765', TO_DATE('1998-10-25', 'YYYY-MM-DD'), 103);
INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (4, 'Andrew Joe', 'andrewjoe@gmail.com', '5432167890', TO_DATE('1999-11-04', 'YYYY-MM-DD'), 104);


--inserting trainers
INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (1, 'Mike Johnson', 'Weightlifting', TO_DATE('2000-03-22', 'YYYY-MM-DD'));
INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (2, 'John Michael', 'Losing weight', TO_DATE('1998-05-27', 'YYYY-MM-DD'));
INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (3, 'Sarah Connor', 'Yoga', TO_DATE('1999-07-17', 'YYYY-MM-DD'));


--inserting training sessions
INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (1, 'Morning Cardio', 2, TO_DATE('2025-05-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (2, 'Strength training', 1, TO_DATE('2025-05-11 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (3, 'Pilates', 3, TO_DATE('2025-05-12 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));


--inserting equpiment
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (1, 'Treadmill');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (2, 'Dumbbells');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (3, 'Barbells');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (4, 'Row machine');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (5, 'Cardio bike');

--inserting subscription types
INSERT INTO "SUBSCRIPTION" (SubscriptionID, PlanName, Cost, DurationMonths) 
VALUES (101, 'Basic Plan', 50.00, 1);
INSERT INTO "SUBSCRIPTION" (SubscriptionID, PlanName, Cost, DurationMonths) 
VALUES (102, 'Premium Plan', 100.00, 3);
INSERT INTO "SUBSCRIPTION" (SubscriptionID, PlanName, Cost, DurationMonths) 
VALUES (103, 'Basic Plan', 50.00, 1);
INSERT INTO "SUBSCRIPTION" (SubscriptionID, PlanName, Cost, DurationMonths) 
VALUES (104, 'Premium Plan', 100.00, 3);

       
--using MERGE to check if a members exists in the table MEMBERS_OF_GYM 
--if they exist, their phone number is updated
--if not, their phone number is added
MERGE INTO MEMBERS_OF_GYM m
USING (
    SELECT 5 AS MemberID, 'Emily Davis' AS FullName, 'emily.davis@gmail.com' AS Email,
           '9876543210' AS PhoneNumber, TO_DATE('1992-03-18', 'YYYY-MM-DD') AS DateOfBirth,
           101 AS SubscriptionID FROM DUAL
) src
ON (m.MemberID = src.MemberID)
WHEN MATCHED THEN
    UPDATE SET m.PhoneNumber = src.PhoneNumber
WHEN NOT MATCHED THEN
    INSERT (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID, JOIN_DATE)
    VALUES (src.MemberID, src.FullName, src.Email, src.PhoneNumber, src.DateOfBirth, src.SubscriptionID, SYSDATE);

       
--using UPDATE
--updating a member's phone number
UPDATE MEMBERS_OF_GYM
SET PhoneNumber = '1111111111'
WHERE MemberID = 1;

--updating trainer specialization
UPDATE TRAINERS
SET Specialization = 'Powerlifting'
WHERE TrainerID = 1;

--using DELETE
--deleting a member of the gym from the MEMBERS_OF_GYM table
DELETE FROM MEMBERS_OF_GYM
WHERE MemberID = 2;

--deleting a subscription from the SUBSCRIPTION table
DELETE FROM SUBSCRIPTION
WHERE SubscriptionID = 102;

SELECT * FROM MEMBERS_OF_GYM;
SELECT * FROM TRAINERS;
SELECT * FROM TRAINING_SESSION;
SELECT * FROM SUBSCRIPTION;

--3.Diverse and relevant SELECT statements
SELECT FullName, Email, Cost
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID
WHERE s.Cost > 50;

SELECT FullName, PlanName, DurationMonths
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID
WHERE s.DurationMonths >= 2;

SELECT FullName, HireDate
FROM Trainers
WHERE HireDate <= TO_DATE('2000-01-01', 'YYYY-MM-DD');

SELECT FullName, SubscriptionID
FROM MEMBERS_OF_GYM
WHERE SubscriptionID != 103;  -- SubscriptionID != 'Basic Plan'

SELECT FullName
FROM TRAINERS
WHERE Specialization IS NULL;

SELECT FullName, Amount
FROM PAYMENTS p
JOIN MEMBERS_OF_GYM m ON p.MemberID = m.MemberID
WHERE Amount > ANY (SELECT Cost FROM SUBSCRIPTION WHERE PlanName = 'Premium Plan');

SELECT FullName, 
CASE 
WHEN Cost <= 50 THEN 'Basic'
WHEN Cost > 50 THEN 'Premium'
ELSE 'Unknown'
END AS SubscriptionStatus
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID;














