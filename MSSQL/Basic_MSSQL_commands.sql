-- List Down existing dbs
SELECT name FROM sys.databases
EXEC sp_databases
-- lower case
exec sp_databases

-- Create a db
CREATE DATABASE school_db
CREATE DATABASE demo

-- Use database 
USE school_db
SELECT DB_NAME()

-- Drop or delete a databse 
DROP DATABASE demo


-- create a table
create table students(
	student_id INT,
	name VARCHAR(100),
	age INT,
	grade INT
)

-- checking existing table
exec sp_help "students"

-- Inserting values in tables
insert into students values (101, 'Raju', 10, 5), (102, 'Sham', 12, 7),  
							(103, 'Baburao', 14, 9), (104, 'Paul', 11, 6)

-- Read data from table
select * from students
select * from students where student_id=102
select name from students
select * from students where student_id=101

-- Updating data from table
update students
	set grade = 12
	where student_id = 101

-- Delete data from a table
delete from students
	where name = 'Raju'
-- it will delete all values one by one that is time consuming
delete from students
	where 1=1

-- TRUNCATE (FOR DELETING ALL ROWS IN A TABLE)
truncate table students
