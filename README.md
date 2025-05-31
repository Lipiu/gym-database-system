# Gym-database-system

**The Gym Database System** is a comprehensive management solution designed to streamline gym operations. It efficiently handles member registrations, attendance tracking, subscription plans, trainer schedules, workout routines, and payment records. The system ensures easy access to data, improves organization, and enhances overall efficiency.

#

**PL/SQL Part**

- This project supports different methods implemented via PL/SQL
  - IF, CASE, FOR, LOOP, WHILE
  - Index by table, nested table, varray
  - Exception handling
    - implicit
    - explicit
  - Cursor management
    - implicit
    - explicit
    - with/without parameters
    - FOR UPDATE
  - Functions and procedures
  - Triggers (to be implemented)

#

# Tables

**MEMBERS_OF_GYM**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| MEMBERID | NUMBER(38, 0) PRIMARY KEY| Unique identifier of members of gym |
| FULLNAME | VARCHAR2(100) | Name of each member of gym
| EMAIL | VARCHAR2(100) | Email of each member of gym|
| PHONENUMBER | VARCHAR2(15) | Phone number of members |
| DATEOFBIRTH | DATE | Birth date |
| SUBSCRIPTIONID | NUMBER(38, 0) | Unique subscription ID of members |
| JOIN_DATE | DATE | Starting date of the membership |
| ADDRESS | VARCHAR2(255) | Address of members |

#

**SUBSCRIPTION**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| SUBSCRIPTIONID | NUMBER(38, 0) PRIMARY KEY | Unique identifier of members of gym |
| PLANNAME | VARCHAR2(50) | Name of subscriptions available |
| COST | NUMBER(5,2) | Cost of each subscription |
| DURATIONMONTHS | NUMBER(38,0) | Duration of each subscription |

#

**PAYMENTS**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| PAYMENTID | NUMBER(38, 0) PRIMARY KEY| Unique ID of each payment |
| MEMBERID | NUMBER(38,0) | Name of each member of gym that payed |
| SUBSCRIPTIONID | NUMBER(38,0) | ID of subscription |
| AMOUNT | NUMBER(6,2) | Price that members payed |
| PAYMENTDATE | DATE | The date in which the member payed |

#

**TRAINERS**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| TRAINERID | NUMBER(38, 0) PRIMARY KEY | Unique identifier of each trainer |
| FULLNAME | VARCHAR2(100) | Name of each trainer |
| SPECIALIZATION | VARCHAR2(50) | Specialization of each trainer |
| HIREDATE | DATE | Date when the trainer was hired |

#

**TRAINING_SESSION**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| TRAININGSESSIONID | NUMBER(38, 0) PRIMARY KEY | Unique identifier of training session |
| TRAININGSESSIONNAME | VARCHAR2(50) | Name of training session |
| TRAINERID | NUMBER(38,0) | ID of trainers |
| SCHEDULE | TIMESTAMP | Available schedule of trainers |

#

**TRAINING_SESSION_MEMBERS**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| TRAININGSESSIONID | NUMBER(38, 0) PRIMARY KEY | Unique identifier of training session |
| MEMBERID | NUMBER(38,0) | ID of member with respect to training session |

#

**EQUIPMENT**
| Column Name | Data Type | Description |
| --------------- | ------------ | ------------------------------------- |
| EQUIPMENTID | NUMBER(38, 0) PRIMARY KEY | Unique identifier for equipment |
| EQUIPMENTNAME | VARCHAR2(50) | Name of each piece of equipment |
