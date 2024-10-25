-- Create the database
#create database BMS_db;
use BMS_db;

-- Create the customer_personal_details table
create table customer_personal_details
(
    customer_name varchar(100),
    customer_id varchar(100),
    mail_id varchar(100),
    DOB date,
    Address varchar(50),
    contact_no bigint,
    ID_DOC_NO varchar(100),
    Citizenship varchar(100),
    Marital_status varchar(100),
    CONSTRAINT customer_pers_pk PRIMARY KEY(customer_id)
);

-- Show tables
show tables;

-- Create the customer_reference_info table
create table customer_reference_info
(
    customer_name varchar(50),
    customer_id varchar(100),
    reference_acc_name varchar(100),
    reference_acc_no bigint,
    relation varchar(25),
    CONSTRAINT cust_ref_info_pk PRIMARY KEY (customer_id),
    CONSTRAINT cust_ref_info_fk FOREIGN KEY (customer_id) REFERENCES customer_personal_details(customer_id)
);

-- Show tables
show tables;

-- Create the Bank_info table
create table Bank_info
(
    IFSC_code varchar(15),
    Bank_name varchar(25),
    Branch_name varchar(25),
    CONSTRAINT Bank_info_pk PRIMARY KEY(IFSC_code)
);

-- Show tables
show tables;

-- Create the Account_info table
create table Account_info
(
    Account_no bigint(16),
    customer_id varchar(100),
    account_type varchar(10),
    registration_date date,
    Activation_date date,
    IFSC_code varchar(15),
    Interest decimal(5,2),
    Initial_deposit bigint,
    CONSTRAINT Acc_info_pers_pk PRIMARY KEY(Account_no),
    CONSTRAINT Acc_info_pers_fk FOREIGN KEY(customer_id) REFERENCES customer_personal_details(customer_id),
    CONSTRAINT Acc_info_bank_fk FOREIGN KEY(IFSC_code) REFERENCES Bank_info(IFSC_code)
);

-- Show tables
show tables;

-- Insert into Bank_info
INSERT INTO Bank_info(IFSC_CODE, Bank_name, Branch_name) 
VALUES 
('sbi00031','SBI','Perungudi'),
('HDVL2345','HDFC','T Nagar');

-- Insert into customer_personal_details
INSERT INTO customer_personal_details (customer_name, customer_id, mail_id, DOB, Address, contact_no, ID_DOC_NO, Citizenship, Marital_status) 
VALUES 
('Amit Sharma', 'CUST001', 'amit.sharma@example.com', '1990-07-12', '12 MG Road, Delhi', 9876543210, 'ID123456', 'Indian', 'Single'),
('Priya Iyer', 'CUST002', 'priya.iyer@example.com', '1985-05-25', '34 T Nagar, Chennai', 8765432109, 'ID789012', 'Indian', 'Married');

-- Insert into customer_reference_info
INSERT INTO customer_reference_info (customer_name, customer_id, reference_acc_name, reference_acc_no, relation)
VALUES 
('Amit Sharma', 'CUST001', 'Rohit Sharma', 123456789012, 'Brother'),
('Priya Iyer', 'CUST002', 'Anjali Kumar', 987654321098, 'Friend');

-- Insert into Account_info
INSERT INTO Account_info (Account_no, customer_id, account_type, registration_date, Activation_date, IFSC_code, Interest, Initial_deposit) 
VALUES 
(1234567890123456, 'CUST001', 'Savings', '2024-01-01', '2024-01-05', 'HDVL2345', 4.0, 50000),
(9876543210987654, 'CUST002', 'Current', '2024-02-01', '2024-02-10', 'sbi00031', 3.5, 200000);

-- Select data to verify insertion
SELECT * FROM customer_personal_details;
SELECT * FROM customer_reference_info;
SELECT * FROM Bank_info;
SELECT * FROM Account_info;
