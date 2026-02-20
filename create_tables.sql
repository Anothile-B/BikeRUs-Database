--Create Volunteer Table
CREATE TABLE Volunteer (
    Vol_ID VARCHAR2(10) PRIMARY KEY,
    Vol_FName VARCHAR2(50) NOT NULL,
    Vol_SName VARCHAR2(50) NOT NULL,
    Contact VARCHAR2(15),
    Address VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE
);

--Create Donor Table
CREATE TABLE Donor (
    Donor_ID VARCHAR2(10) PRIMARY KEY,
    Donor_FName VARCHAR2(50) NOT NULL,
    Donor_LName VARCHAR2(50) NOT NULL,
    Contact_No VARCHAR2(15),
    Email VARCHAR2(100) UNIQUE
);

--Create Bike Table
CREATE TABLE Bike (
    Bike_ID VARCHAR2(10) PRIMARY KEY,
    Description VARCHAR2(100) NOT NULL,
    Bike_Type VARCHAR2(50),
    Manufacturer VARCHAR2(50) 
);

--Create Donation Table
CREATE TABLE Donation (
    Donation_ID NUMBER PRIMARY KEY,
    Donor_ID VARCHAR2(10),
    Bike_ID VARCHAR2(10),
    Value NUMBER(10,2) CHECK (Value > 0),
    Volunteer_ID VARCHAR2(10),
    Donation_Date DATE,
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID),
    FOREIGN KEY (Bike_ID) REFERENCES Bike(Bike_ID),
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Vol_ID)
);
