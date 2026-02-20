BikeRUs Database System

Project Overview

-BikeRUs is a relational database system designed to manage bicycle donations, donors, volunteers, and donation transactions.
-This project demonstrates database design principles, SQL querying, PL/SQL programming, and data integrity enforcement using SQL Server Manager.
-The system was developed as part of academic coursework and enhanced for portfolio presentation.


Business Problem

A non-profit organization called BikeRUs collects donated bicycles and distributes them to communities in need.

The organization needs a system to:

- Store donor information
- Track bicycles donated
- Record volunteers assisting with donations
- Calculate donation values including VAT
- Prevent unauthorized deletion of donation records
- Generate structured donation reports

The current manual tracking system is inefficient and prone to data inconsistencies.  
This database solution ensures structured storage, integrity, and reporting capability.



Database Structure

The system consists of four main entities:

- Volunteer
- Donor
- Bike
- Donation
  

Entity Relationships

- A Donor can donate multiple bikes.
- A Volunteer assists with multiple donations.
- Each Donation links:
  - One donor
  - One bike
  - One volunteer



Normalization

The database design follows normalization principles:

First Normal Form (1NF)
- No repeating groups
- All fields contain atomic values

Second Normal Form (2NF)
- All non-key attributes fully depend on the primary key

Third Normal Form (3NF)
- No transitive dependencies
- Donor, Volunteer, and Bike details are separated into individual tables

This prevents redundancy and improves data consistency.



Constraints & Data Integrity

The database includes:

- Primary Keys
- Foreign Keys
- UNIQUE constraints (Email fields)
- CHECK constraint (Donation value > 0)
- NOT NULL constraints

These ensure accuracy and prevent invalid data entry.



Advanced SQL & PL/SQL Features

This project demonstrates:

- Complex JOIN queries
- Views for simplified reporting
- Stored Procedures
- User-defined Functions
- Cursors
- Conditional logic (CASE statements)
- Triggers for business rule enforcement



Trigger Implementation

-A trigger (`trg_NoDeleteDonation`) prevents deletion of donation records.
-This enforces a critical business rule:
> Donation records cannot be removed once recorded.
-The trigger raises a custom application error to prevent data loss.



Reporting Features

The system generates:

- Road bike VAT-inclusive reports
- Donation summary per volunteer
- Bike value classification reports (*, **, ***)
- Volunteer donation totals

Reports are formatted using `DBMS_OUTPUT`.


Project Structure
BikeRUs-Database
1. create_tables.sql
2. insert_data.sql
3. queries.sql
4. views.sql
5. procedures.sql
6. functions.sql
7. triggers.sql
8. reports. sql



Technologies Used

- SQL Server Management
- PL/SQL
- Relational Database Design






