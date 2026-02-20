-- Insert Table Data
-- Insert Volunteer Data
INSERT INTO Volunteer VALUES ('vol101','Kenny','Temba','0677277521','10 Sands Road','kennyt@bikerus.com');
INSERT INTO Volunteer VALUES ('vol102','Mamelodi','Marks','0737377522','20 Langes Street','mamelodim@bikerus.com');
INSERT INTO Volunteer VALUES ('vol103','Ada','Andrews','0817117523','31 Williams Street','adanyaa@bikerus.com');
INSERT INTO Volunteer VALUES ('vol104','Evans','Tambala','0697215244','1 Free Road','evanst@bikerus.com');
INSERT INTO Volunteer VALUES ('vol105','Xolani','Samson','0727122255','12 Main Road','xolanis@bikerus.com');
SELECT * FROM Volunteer;

-- Insert Donor Data
INSERT INTO Donor VALUES ('DID11','Jeff','Wanya','0827172250','wanyajeff@ymail.com');
INSERT INTO Donor VALUES ('DID12','Sthembeni','Pisho','0837865670','sthepisho@ymail.com');
INSERT INTO Donor VALUES ('DID13','James','Temba','0878978650','jimmy@ymail.com');
INSERT INTO Donor VALUES ('DID14','Luramo','Misi','0826575650','luramom@ymail.com');
INSERT INTO Donor VALUES ('DID15','Abraham','Xolani','0797656430','axolani@ymail.com');
INSERT INTO Donor VALUES ('DID16','Rumi','Jones','0668899221','rjones@true.com');
INSERT INTO Donor VALUES ('DID17','Xolani','Redo','0614553389','xredo@ymail.com');
INSERT INTO Donor VALUES ('DID18','Tenny','Stars','0824228870','tenstars@true.com');
INSERT INTO Donor VALUES ('DID19','Tiny','Rambo','0715554333','trambo@ymail.com');
INSERT INTO Donor VALUES ('DID20','Yannick','Leons','0615554323','yleons@true.com');
SELECT * FROM Donor;

-- Insert Bike Data
INSERT INTO Bike VALUES ('B001','BMX AX1','Road Bike','BMX');
INSERT INTO Bike VALUES ('B002','Giant Domain 1','Road Bike','Giant');
INSERT INTO Bike VALUES ('B003','Ascent 26In','Mountain Bike','Raleigh');
INSERT INTO Bike VALUES ('B004','Canyon 6X','Kids Bike','Canyon');
INSERT INTO Bike VALUES ('B005','Marvel Gravel','Road Bike','BMX');
INSERT INTO Bike VALUES ('B006','Mountain 21 Speed','Mountain Bike','BMX');
INSERT INTO Bike VALUES ('B007','Canyon Roadster','Road Bike','Canyon');
INSERT INTO Bike VALUES ('B008','Legion 101','Hybrid Bike','BMX');
INSERT INTO Bike VALUES ('B009','Madonna 9','Road Bike','Trek');
INSERT INTO Bike VALUES ('B010','Comp 2022','Mountain Bike','Trek');
INSERT INTO Bike VALUES ('B011','BMX AX15','Road Bike','BMX');
SELECT * FROM Bike;

-- Insert Donation Data
INSERT INTO Donation VALUES (1,'DID11','B001',1500,'vol101',TO_DATE('01-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (2,'DID12','B002',2500,'vol101',TO_DATE('03-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (3,'DID13','B003',1000,'vol103',TO_DATE('03-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (4,'DID14','B004',1750,'vol105',TO_DATE('05-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (5,'DID15','B006',2000,'vol101',TO_DATE('07-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (6,'DID16','B007',1800,'vol105',TO_DATE('09-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (7,'DID17','B008',1500,'vol101',TO_DATE('15-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (8,'DID18','B009',1500,'vol103',TO_DATE('19-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (9,'DID12','B010',2500,'vol103',TO_DATE('25-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (10,'DID20','B005',3500,'vol105',TO_DATE('05-May-23','DD-Mon-RR'));
INSERT INTO Donation VALUES (11,'DID19','B011',2500,'vol103',TO_DATE('30-May-23','DD-Mon-RR'));
SELECT * FROM Donation;

COMMIT;

