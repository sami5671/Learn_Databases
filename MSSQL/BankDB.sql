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

exec sp_help 'employees'

INSERT INTO employees
(fname, lname, email, job_title, department, salary, hire_date, city)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 
'Mumbai'),
('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),
('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 
'Bengaluru'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 
'Mumbai'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 
'Hyderabad'),
('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 
'Delhi'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 
'Mumbai'),
('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 
'Pune'),
('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 
'Mumbai'),
('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 
'Bengaluru'),
('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),
('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 
'Hyderabad'),
('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 
'Delhi'),
('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),
('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');


-- see all data --
SELECT * FROM employees

INSERT INTO employees
(fname, lname, email, job_title, department, city)
VALUES
(null, 'Verma', 'null.verma@example.com', 'Director', 'Management', 'Mumbai')

select * from employees

-- WHERE Clause --
SELECT * FROM employees WHERE emp_id=111
SELECT * FROM employees WHERE department != 'Sales'
SELECT * FROM employees WHERE salary > 100000
SELECT * FROM employees WHERE hire_date < '2020-12-31'

-- DISTINCT ----
SELECT DISTINCT city FROM employees
SELECT DISTINCT department FROM employees

-- ORDER BY --
SELECT * FROM employees ORDER BY salary 
SELECT * FROM employees ORDER BY salary DESC
SELECT * FROM employees ORDER BY hire_date 
SELECT * FROM employees ORDER BY fname DESC

SELECT department, fname, salary FROM employees
SELECT department, fname, salary FROM employees ORDER BY department, fname, salary

--- LIKE ----
SELECT * FROM employees WHERE department LIKE '%MAN%'
SELECT * FROM employees WHERE fname LIKE '[ABCDE]%'
SELECT * FROM employees WHERE fname LIKE '[^A]%'
SELECT * FROM employees WHERE fname LIKE '_a%'
SELECT * FROM employees WHERE fname LIKE '____'
SELECT * FROM employees WHERE email LIKE '%gupta%'

----- TOP ----
SELECT TOP 3 * FROM employees ORDER BY salary DESC
SELECT TOP 5 * FROM employees ORDER BY hire_date DESC
SELECT TOP 3 * FROM employees where department = 'Tech' ORDER BY fname
SELECT TOP 2 * FROM employees 

---- EXERCISE PEACTICE----------
---- 1: Find Different type of departments in database?
---- 2: Display records with High-low salary
---- 3: How to see only top 3 records from a table?
---- 4: Show records where first name start with letter 'A'
---- 5: Show records where length of the lname is 4 characters
SELECT * FROM employees

SELECT DISTINCT department from employees
SELECT * FROM employees ORDER BY salary DESC
SELECT TOP 3 * FROM employees 
SELECT * FROM employees WHERE fname LIKE 'A%'
SELECT * FROM employees WHERE fname LIKE '____'

--- Logical Operators --
SELECT * FROM employees WHERE salary=75000 AND department='Sales' 
SELECT * FROM employees WHERE salary=75000 OR department='Sales' OR city='Mumbai'
SELECT * FROM employees WHERE department NOT IN ('Tech', 'Sales', 'Management')
SELECT * FROM employees WHERE salary BETWEEN 75000 AND 100000

--- IN and BETWEEN
SELECT * FROM employees WHERE department IN ('Tech', 'Sales', 'Management')
SELECT * FROM employees WHERE department NOT IN ('Tech', 'Sales', 'Management')
SELECT * FROM employees WHERE salary BETWEEN 75000 AND 100000

--- CASE ----
SELECT fname, lname, salary,
	CASE 
		WHEN salary > 100000 THEN 'High Earner'
		WHEN salary > 80000 AND salary <= 100000 THEN 'Medium Earner'
		ELSE 'Standard Earner'
	END AS salary_band
FROM employees

--- CASE EXERCISE 1----
SELECT fname, lname, department, salary,
	CASE 
		WHEN department IN ('Sales', 'Marketing') THEN salary * 0.10
		WHEN department = 'Tech' THEN salary * 0.12
		ELSE salary * 0.05
	END AS bonus_amount
FROM employees

--- CASE EXERCISE 2----
SELECT fname, lname, salary,
	CASE 
		WHEN salary >= 100000 THEN 'High'
		WHEN salary >= 75000 AND salary < 100000 THEN 'Mid'
		ELSE 'Low'
	END AS salary_band
FROM employees


