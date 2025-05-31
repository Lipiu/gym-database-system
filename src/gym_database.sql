-- 1. Constructing the database tables
SET SERVEROUTPUT ON;
-- create the table subscription
CREATE TABLE "SUBSCRIPTION" (
    SubscriptionID INT PRIMARY KEY,
    PlanName VARCHAR(50),
    Cost DECIMAL(5, 2),
    DurationMonths INT
);

-- create the table members of gym
CREATE TABLE "MEMBERS_OF_GYM" (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    DateOfBirth DATE,
    SubscriptionID INT,
    JOIN_DATE DATE DEFAULT SYSDATE,
    Address VARCHAR(255),
    FOREIGN KEY (SubscriptionID) REFERENCES SUBSCRIPTION(SubscriptionID)
);

-- create the table trainers
CREATE TABLE "TRAINERS" (
    TrainerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Specialization VARCHAR(50),
    HireDate DATE DEFAULT SYSDATE
);

-- create the table training session
CREATE TABLE "TRAINING_SESSION" (
    TrainingSessionID INT PRIMARY KEY,
    TrainingSessionName VARCHAR(50),
    TrainerID INT,
    Schedule TIMESTAMP,
    FOREIGN KEY (TrainerID) REFERENCES TRAINERS(TrainerID)
);

-- create the table training session members
CREATE TABLE TRAINING_SESSION_MEMBERS (
    TrainingSessionID INT,
    MemberID INT,
    PRIMARY KEY (TrainingSessionID, MemberID),
    FOREIGN KEY (TrainingSessionID) REFERENCES TRAINING_SESSION(TrainingSessionID),
    FOREIGN KEY (MemberID) REFERENCES MEMBERS_OF_GYM(MemberID)
);

-- create the table equipment
CREATE TABLE "EQUIPMENT" (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(50)
);

-- create the table payments
CREATE TABLE PAYMENTS (
    PaymentID INT PRIMARY KEY,
    MemberID INT,
    SubscriptionID INT,
    Amount DECIMAL(6, 2),
    PaymentDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (MemberID) REFERENCES MEMBERS_OF_GYM(MemberID),
    FOREIGN KEY (SubscriptionID) REFERENCES SUBSCRIPTION(SubscriptionID)
);

----------------------------------

-- 2. Inserting data into tables

--inserting into subscription
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (101, 'Basic Plan', 50.00, 1);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (102, 'Premium Plan', 100.00, 3);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (103, 'Basic Plan', 50.00, 1);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (104, 'Premium Plan', 100.00, 3);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (105, 'Basic Plan', 50.00, 1);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (106, 'Premium Plan', 100.00, 3);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (107, 'Basic Plan', 50.00, 1);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (108, 'Premium Plan', 100.00, 3);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (109, 'Basic Plan', 50.00, 1);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (110, 'Premium Plan', 100.00, 3);
INSERT INTO SUBSCRIPTION (SubscriptionID, PlanName, Cost, DurationMonths) VALUES (112, 'Premium Plan', 100.00, 3);

--inserting members of gym
INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (1, 'John Doe', 'john.doe@gmail.com', '1234567890', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 101);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (2, 'Mike Johnson', 'mike.johnson@gmail.com', '0987654321', TO_DATE('1995-07-20', 'YYYY-MM-DD'), 102);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (3, 'Alice Matthews', 'alicematthwes@gmail.com', '1234098765', TO_DATE('1998-10-25', 'YYYY-MM-DD'), 103);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (4, 'Andrew Joe', 'andrewjoe@gmail.com', '5432167890', TO_DATE('1999-11-04', 'YYYY-MM-DD'), 104);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (5, 'John Smith', 'johnsmith@gmail.com', '0238495607', TO_DATE('1993-07-21', 'YYYY-MM-DD'), 105);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (6, 'Daniel Miller', 'danielmiller@gmail.com', '0659231837', TO_DATE('2003-02-20', 'YYYY-MM-DD'), 106);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (7, 'Emma Martinez', 'emma.martinez@gmail.com', '0436586978', TO_DATE('1998-10-25', 'YYYY-MM-DD'), 107);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (8, 'Sophia Brown', 'sophiabrown@gmail.com', '0475697821', TO_DATE('1999-11-04', 'YYYY-MM-DD'), 108);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (9, 'Michael Williams', 'michaelwilliams@gmail.com', '0348695869', TO_DATE('2002-06-04', 'YYYY-MM-DD'), 109);

INSERT INTO MEMBERS_OF_GYM (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID) 
VALUES (10, 'Olivia Garcia', 'oliviagarcia@gmail.com', '0492182738', TO_DATE('2001-04-04', 'YYYY-MM-DD'), 110);

-- inserting trainers
INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (1, 'Mike Johnson', 'Weightlifting', TO_DATE('2000-03-22', 'YYYY-MM-DD'));

INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (2, 'John Michael', 'Losing weight', TO_DATE('1998-05-27', 'YYYY-MM-DD'));

INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (3, 'Sarah Connor', 'Yoga', TO_DATE('1999-07-17', 'YYYY-MM-DD'));

INSERT INTO TRAINERS (TrainerID, FullName, Specialization, HireDate) 
VALUES (4, 'No Spec Trainer', NULL, TO_DATE('1995-01-01', 'YYYY-MM-DD'));

-- inserting training sessions
INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (1, 'Morning Cardio', 2, TO_TIMESTAMP('2025-05-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (2, 'Strength training', 1, TO_TIMESTAMP('2025-05-11 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TRAINING_SESSION (TrainingSessionID, TrainingSessionName, TrainerID, Schedule) 
VALUES (3, 'Pilates', 3, TO_TIMESTAMP('2025-05-12 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- inserting training session members
INSERT INTO TRAINING_SESSION_MEMBERS (TrainingSessionID, MemberID) VALUES (1, 1);
INSERT INTO TRAINING_SESSION_MEMBERS (TrainingSessionID, MemberID) VALUES (1, 3);
INSERT INTO TRAINING_SESSION_MEMBERS (TrainingSessionID, MemberID) VALUES (2, 4);
INSERT INTO TRAINING_SESSION_MEMBERS (TrainingSessionID, MemberID) VALUES (3, 7);

-- inserting equipment
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (1, 'Treadmill');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (2, 'Dumbbells');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (3, 'Barbells');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (4, 'Row machine');
INSERT INTO EQUIPMENT (EquipmentID, EquipmentName) VALUES (5, 'Cardio bike');

----------------------------------

MERGE INTO MEMBERS_OF_GYM m
USING (
    SELECT 12 AS MemberID, 'Rosu Liviu-Mihai' AS FullName, 'rosuliviu23@stud.ase.ro' AS Email,
           '0767691019' AS PhoneNumber, TO_DATE('2004-05-28', 'YYYY-MM-DD') AS DateOfBirth,
           112 AS SubscriptionID FROM DUAL
) src
ON (m.MemberID = src.MemberID)
WHEN MATCHED THEN
    UPDATE SET m.PhoneNumber = src.PhoneNumber
WHEN NOT MATCHED THEN
    INSERT (MemberID, FullName, Email, PhoneNumber, DateOfBirth, SubscriptionID, JOIN_DATE)
    VALUES (src.MemberID, src.FullName, src.Email, src.PhoneNumber, src.DateOfBirth, src.SubscriptionID, SYSDATE);
    
    
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
WHERE SubscriptionID != 103;

SELECT FullName, JOIN_DATE 
FROM MEMBERS_OF_GYM 
WHERE JOIN_DATE > SYSDATE - 30;

SELECT TrainingSessionName, Schedule 
FROM TRAINING_SESSION 
WHERE Schedule > TO_DATE('2025-01-01', 'YYYY-MM-DD');

SELECT FullName
FROM TRAINERS
WHERE Specialization IS NULL;

SELECT FullName, Amount
FROM PAYMENTS p
JOIN MEMBERS_OF_GYM m ON p.MemberID = m.MemberID
WHERE Amount > (SELECT MAX(Cost) FROM SUBSCRIPTION WHERE PlanName = 'Premium Plan');

SELECT FullName, 
CASE 
    WHEN Cost <= 50 THEN 'Basic'
    WHEN Cost > 50 THEN 'Premium'
    ELSE 'Unknown'
END AS SubscriptionStatus
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID;


----------------------------------

-- PL/SQL part

-- A. Interaction with the Oracle server through SQL commands (DDL and DML) in PL/SQL
-- blocks: using execute immediate, particularities regarding the use of the select 
DECLARE
v_count NUMBER;
BEGIN
-- count how many members are subscribed to planID 101
SELECT COUNT(*) INTO v_count
FROM members_of_gym
WHERE SubscriptionID = 101;
dbms_output.put_line('Number of members with subscription id = 101: ' || v_count);
END;
/

-- B. Alternative and repetitive structures (IF, CASE, FOR, LOOP, WHILE).
-- prompt the user to enter a subscription type and display the price
DECLARE
v_plan VARCHAR(20) := '&Enter_plan_name';
BEGIN
CASE v_plan
WHEN 'Basic' THEN
dbms_output.put_line('Cost is 50$');
WHEN 'Premium' THEN
dbms_output.put_line('Cost is 100$');
ELSE
dbms_output.put_line('Unknown subscription');
END CASE;
END;
/

-- check if a member's subscription is basic or premium
DECLARE
  v_member_id MEMBERS_OF_GYM.MemberID%TYPE := 12;
  v_plan_name SUBSCRIPTION.PlanName%TYPE;
BEGIN
SELECT s.PlanName
INTO v_plan_name
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID
WHERE m.MemberID = v_member_id;
IF v_plan_name = 'Premium Plan' THEN
DBMS_OUTPUT.PUT_LINE('Member ' || v_member_id || ' has a Premium subscription.');
ELSE
DBMS_OUTPUT.PUT_LINE('Member ' || v_member_id || ' has a Basic subscription.');
END IF;
END;

-- display a message based on equipment availability
DECLARE
v_equipment_name EQUIPMENT.EquipmentName%TYPE := 'Treadmill';
BEGIN
CASE v_equipment_name
WHEN 'Treadmill' THEN
DBMS_OUTPUT.PUT_LINE('Cardio equipment available.');
WHEN 'Dumbbells' THEN
DBMS_OUTPUT.PUT_LINE('Strength training equipment available.');
ELSE
DBMS_OUTPUT.PUT_LINE('Equipment type unknown or not available.');
END CASE;
END;
/

-- display all members and their subscription plans
BEGIN
FOR rec IN (
SELECT m.FullName, s.PlanName
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID
)
LOOP
DBMS_OUTPUT.PUT_LINE('Member: ' || rec.FullName || ' - Plan: ' || rec.PlanName);
END LOOP;
END;

----------------------------------

-- C. Data collections (index by table, nested table, varray).
DECLARE
TYPE EquipmentTable IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
v_equipment EquipmentTable;
i PLS_INTEGER := 0;
BEGIN
FOR rec IN (SELECT EquipmentName FROM EQUIPMENT ORDER BY EquipmentID) LOOP
i := i + 1;
v_equipment(i) := rec.EquipmentName;
END LOOP;
END;
/

i := v_equipment.FIRST;
WHILE i IS NOT NULL LOOP
DBMS_OUTPUT.PUT_LINE('Equipment ' || i || ': ' || v_equipment(i));
i := v_equipment.NEXT(i);
END LOOP;
END;
/

--index-by table
DECLARE
TYPE member_name_table IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
v_names member_name_table;
BEGIN
v_names(1) := 'Liviu';
v_names(2) := 'Mihnea';

dbms_output.put_line('Member 1: ' || v_names(1));
dbms_output.put_line('Member 2: ' || v_names(2));
END;
/

--varray (variable size array)
DECLARE
TYPE member_name_var_array IS VARRAY(5) OF VARCHAR2(100);
v_names member_name_var_array := member_name_var_array('John', 'Alice');
BEGIN
v_names.EXTEND;
v_names(3) := 'Bob';
FOR i IN 1 .. v_names.COUNT LOOP
DBMS_OUTPUT.PUT_LINE('Member: ' || v_names(i));
END LOOP;
END;
/

--nested table (like a list but not fixed size, can grow as needed)
DECLARE
TYPE Member_id_table IS TABLE OF NUMBER;
v_member_ids Member_id_table := Member_id_table();
BEGIN
v_member_ids.EXTEND(3);
v_member_ids(1) := 101;
v_member_ids(2) := 102;
v_member_ids(3) := 103;

FOR i IN 1 .. v_member_ids.COUNT LOOP
DBMS_OUTPUT.PUT_LINE('Member ID: ' || v_member_ids(i));
END LOOP;
END;
/


-- D. Exception handling (minimum 3 implicit, 2 explicit).
-- implicit
DECLARE
v_name EQUIPMENT.EquipmentName%TYPE;
BEGIN
SELECT EquipmentName INTO v_name FROM EQUIPMENT
WHERE EquipmentID = 9999; -- testing for an id that does not exist
dbms_output.put_line('Equipment: ' || v_name);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('No equipment found with that specified ID!');
END;
/

DECLARE
v_name EQUIPMENT.EquipmentName%TYPE;
BEGIN
SELECT EquipmentName into v_name FROM EQUIPMENT; -- here the program will return multiple rows because of no WHERE clause
dbms_output.put_line('Equipment: ' || v_name);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
dbms_output.put_line('Too many rows returned!');
END;
/

-- explicit
DECLARE
v_trainer_id TRAINERS.TrainerID%TYPE := 100; -- invalid trainer ID
v_name TRAINERS.FullName%TYPE;
e_trainer_not_found EXCEPTION;
BEGIN
SELECT FullName INTO v_name
FROM TRAINERS
WHERE TrainerID = v_trainer_id;

DBMS_OUTPUT.PUT_LINE('Trainer: ' || v_name);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Trainer with ID ' || v_trainer_id || ' not found.');
END;
/


DECLARE
v_subscription_duration SUBSCRIPTION.durationmonths%type := 12; --number of months that exceeds the max (12)
BEGIN
IF v_subscription_duration > 12 THEN
RAISE_APPLICATION_ERROR(-20001, 'Subscription period cannot exceed one month');
END IF;
dbms_output.put_line('Valid subscription');
END;
/


--------------------------------------
-- E. cursors

--explicit cursor
DECLARE 
CURSOR member_cursor IS SELECT fullname, email
FROM members_of_gym;
v_name members_of_gym.fullname%type;
v_email members_of_gym.email%type;
BEGIN
OPEN member_cursor;
LOOP
FETCH member_cursor INTO v_name, v_email;
EXIT WHEN member_cursor%NOTFOUND;
dbms_output.put_line('Member: ' || v_name || '; ' || 'Member email: ' || v_email);
END LOOP;
END;
/

--implicit cursor with DELETE
BEGIN
  DELETE FROM MEMBERS_OF_GYM
  WHERE SubscriptionID IS NULL;

  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' member(s) deleted.');
END;
/

--explicit with paramteres
DECLARE
CURSOR c_subscription(p_cost NUMBER) IS
SELECT FullName FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s ON m.SubscriptionID = s.SubscriptionID
WHERE s.Cost > p_cost;
v_name MEMBERS_OF_GYM.FullName%TYPE;

BEGIN
OPEN c_subscription(50); -- Only members with plans costing more than 50
LOOP
FETCH c_subscription INTO v_name;
EXIT WHEN c_subscription%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Member: ' || v_name);
END LOOP;
CLOSE c_subscription;
END;
/

--cursor update
DECLARE
CURSOR c IS
SELECT MemberID, PhoneNumber FROM MEMBERS_OF_GYM
WHERE SubscriptionID = 101
FOR UPDATE;
v_id MEMBERS_OF_GYM.MemberID%TYPE;
v_phone MEMBERS_OF_GYM.PhoneNumber%TYPE;
BEGIN
OPEN c;
LOOP
FETCH c INTO v_id, v_phone;
EXIT WHEN c%NOTFOUND;
    
UPDATE MEMBERS_OF_GYM
SET PhoneNumber = '0000000000'
WHERE CURRENT OF c;
    
DBMS_OUTPUT.PUT_LINE('Updated member ID: ' || v_id);
END LOOP;
CLOSE c;
END;
/
SELECT * FROM members_of_gym;

--------------------------------
-- F.
CREATE OR REPLACE PROCEDURE register_member(
p_member_id IN MEMBERS_OF_GYM.memberid%type,
p_full_name IN MEMBERS_OF_GYM.fullname%type,
p_email IN MEMBERS_OF_GYM.email%type,
p_phone_number IN MEMBERS_OF_GYM.phonenumber%type,
p_date_of_birth IN MEMBERS_OF_GYM.dateofbirth%type,
p_subscription_id IN MEMBERS_OF_GYM.subscriptionid%type,
p_join_date IN MEMBERS_OF_GYM.join_date%type,
p_address IN MEMBERS_OF_GYM.address%type
)
IS
v_sub_exists NUMBER;
v_member_exists NUMBER;
BEGIN
  -- Check if Subscription ID exists
SELECT COUNT(*) INTO v_sub_exists
FROM SUBSCRIPTION
WHERE SubscriptionID = p_subscription_id;

IF v_sub_exists = 0 THEN
dbms_output.put_line('Invalid subscription ID: ' || p_subscription_id);
RETURN; -- Stop the procedure if subscription ID is invalid
END IF;

-- Check if Member ID already exists
SELECT COUNT(*) INTO v_member_exists
FROM MEMBERS_OF_GYM
WHERE memberid = p_member_id;

IF v_member_exists > 0 THEN
dbms_output.put_line('Member ID already exists: ' || p_member_id);
RETURN; -- Stop the procedure if member ID is duplicate
END IF;

INSERT INTO MEMBERS_OF_GYM(
memberid, fullname, email, phonenumber, dateofbirth, subscriptionid, join_date, address
)
VALUES(
p_member_id, p_full_name, p_email, p_phone_number, p_date_of_birth, p_subscription_id, p_join_date, p_address
);

dbms_output.put_line('Member: ' || p_full_name || ' registered successfully!');
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
dbms_output.put_line('Member with same ID or email already exists!');
WHEN OTHERS THEN
dbms_output.put_line('Unexpected error: ' || SQLERRM);
END;
/


BEGIN
register_member(
15,
'Test Member duplicate',
'test_member_duplicate@gmail.com',
'0123456789',
TO_DATE('2025-05-28', 'YYYY-MM-DD'),
120,  -- existing SubscriptionID
SYSDATE,
'test street name.'
);
END;
/

BEGIN
register_member(
15,  -- now we try the same id again
'Test Again',
'anotheremail@gmail.com',
'0770000000',
TO_DATE('1995-01-01', 'YYYY-MM-DD'),
101,
SYSDATE,
'Another street'
);
END;
/


SELECT * FROM MEMBERS_OF_GYM;

--show member subscription by member id
CREATE OR REPLACE PROCEDURE show_member_subscription(p_member_id MEMBERS_OF_GYM.MemberID%TYPE)
IS
v_name MEMBERS_OF_GYM.FULLNAME%TYPE;
v_plan SUBSCRIPTION.PLANNAME%TYPE;
v_cost SUBSCRIPTION.COST%TYPE;

BEGIN
SELECT m.FullName, s.PlanName, s.Cost
INTO v_name, v_plan, v_cost
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s on m.SubscriptionID = s.SubscriptionID
WHERE m.MemberID = p_member_id;

dbms_output.put_line('Member: ' || v_name);
dbms_output.put_line('Subscription Plan: ' || v_plan);
dbms_output.put_line('Cost: $' || v_cost);

EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('No member found with ID: ' || p_member_id);
END;
/

-- testing show_member_sbuscription with valid input
BEGIN
show_member_subscription(101);
END;
/


CREATE OR REPLACE PROCEDURE count_members_by_plan(p_plan_name IN SUBSCRIPTION.PlanName%TYPE)
IS
v_count NUMBER;
BEGIN
SELECT COUNT(*) INTO v_count
FROM MEMBERS_OF_GYM m
JOIN SUBSCRIPTION s on m.SubscriptionID = s.SubscriptionID
WHERE s.PlanName = p_plan_name;
dbms_output.put_line('Number of members subscribed to ' || p_plan_name || ': ' || v_count);
END;
/

SELECT DISTINCT PlanName FROM SUBSCRIPTION;

BEGIN
count_members_by_plan('Premium Plan');
END;
/

-------------

--function to calculate BMI
CREATE OR REPLACE FUNCTION calculate_bmi(p_weight IN NUMBER, p_height IN NUMBER)
RETURN NUMBER IS
BEGIN
RETURN ROUND(p_weight / (p_height * p_height), 2);
END;
/
--testing
SELECT calculate_bmi(80, 1.88) as bmi FROM DUAL;


CREATE OR REPLACE FUNCTION get_member_age(p_member_id IN NUMBER)
RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, dateofbirth) / 12)
    INTO v_age
    FROM MEMBERS_OF_GYM
    WHERE memberid = p_member_id;

    RETURN v_age;
END;
/

SELECT get_member_age(1) AS age FROM DUAL;

SELECT memberid, FULLNAME, dateofbirth FROM MEMBERS_OF_GYM;


