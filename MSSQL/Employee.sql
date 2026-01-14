-- Task: Creating Employee Table ----
CREATE DATABASE bank_db
USE bank_db

-- CREATE TABLE ---
CREATE TABLE employees (
emp_id INT IDENTITY(101,1) PRIMARY KEY,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
job_title VARCHAR(50) NOT NULL, 
department VARCHAR(50),    
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CONVERT(date, GETDATE()),
city VARCHAR(50)
);