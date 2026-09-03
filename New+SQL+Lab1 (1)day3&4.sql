create database BankingDB;

USE BankingDB;
CREATE TABLE customers_03
(
    customerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe customers;

insert into customers_03(customerID,FirstName,LastName,Email,Phone)
values(101,'Raj','Karve','raj_k@gmail.com',9881004242);

Create Table persons_03(
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255)NOT NULL,
   Age int
   );
desc Persons_03;

-- add null constraints to 'Age' column--
ALTER table persons_03 modify column Age int NOT NULL;   
   
insert into persons_03 values(1,'Deshmukh','Vaishnavi',23);

select FirstName,LastName,concat (FirstName," ",LastName) as'Employee Name' from persons_03;

-- Unique --
Alter table persons_03 add column Email varchar(200);

ALTER table persons_03 modify column Email varchar(200) unique;

desc persons_03;
insert into persons_03 values(2,'Saxsena','Rajeev',23,'rajeev-saxxsena@gmail.com'),
(3,'Kapoor','Jay',26,'kapoor_jay12@gmail.com'),(4,'Kale','Prachi',23,'prachi_kale@gmail.com');

select *from persons_03;

ALTER table persons_03 modify column ID int primary key;

desc persons_03;

-- Check() constraint on 'age' column --
alter table persons_03 modify column age int check(age>18);

desc persons_03;

select *from persons_03;

insert into persons_03 values(5,'Gandhi','Rahul',55,'gandhi_rahul12@gmail.com');

# Error core: 3819 Check constraint 'persons_chk' is violated. 0.000 sec

insert into persons_03 values((7,'Gandhi','Sanjay',14,'gandhi_sanjay54@gmail.com');

-- Date :01/sep/2026--
-- Default Constraint in sql--

-- DEFAULT : the DEFAULT constraint is used to automatically assign a default value to a column
-- when no value is specified during an INSEART operation--


   CREATE TABLE Employee_012(
		EmployeeID INT PRIMARY Key,
		EmployeeName VARCHAR(100)Not null,
        Department Varchar(50),
        Salary decimal(10,2) default(20000),
        JoiningDate DATE Default (CURRENT_DATE),
         City Varchar(50)
        );
        
  -- alter table employee modify column joiningDate Date default '2026/09/01';      
        
Desc Employee_012;

select *from  Employee_012;

-- Insert One Record --
  INSERT into Employee_012
  (EmployeeID, EmployeeName, Department, Salary, City)
  values(1,'Shruti Jadhav','IT',50000,'Mumbai');
  
  alter table Employee_012 modify column Salary int default 20000;
  
  select * from Employee_012;
  
  INSERT into Employee_012
  (EmployeeID, EmployeeName, Department, City)
  values
     (3,'Raju Pande','Logistics','Pune'),
     (4,'Vaishu Wasnik', 'HR', 'Pune'),
	 (5,'Akanksha Mohitkar', 'Finance','Delhi'),
	 (6,'Satyam Pandey', 'Accountant','Nagpur'),
	 (7,'Seju Devtade', 'Marketing','Gujarat');
  
  # adding DEFAULT constraint to an existing table
  
  Alter Table Employee_012
  Alter City set default 'Nagpur';
  
  desc Employee_012;
  
  -- Insert 
  INSERT into Employee_012
  (EmployeeID, EmployeeName, Department, Salary)
  values
     (8,'Raju Pande','Logistics',24000);

desc Employee_012;

-- Delete the row with specific condition of ' Employee_012' is 7 of the teble
 delete from Employee_012 where EmployeeID=7;
 
 select * from Employee_012;
 desc Employee_012;

#Foreign key
/*A Foreign key is used to create a relationship between two tables.alter

it insures that value of one table must exist in another table. */

#1) Create the parent Table
Create Table Department (
DepartmentID INT Primary key,
DepartmentName varchar(50)
); 

#2) Insert Data into Department table

Insert into Department (DepartmentID,DepartmentName)
values
(101,'IT'),
(102,'HR'),
(103,'Finance');

#3) create the child table with a foregin key
  Create Table employee_child(
   EmployeeID int primary key,
   EmployeeName varchar(100),
   DepartmentID int,
   ManagerID varchar(50),
   
   foreign key (DepartmentID)
   references Department(DepartmentID),
   
   foreign key(ManagerID)
   references Manager_1(ManagerID)
   );
   
   
   Create Table Manager_1(
   ManagerID varchar(50) primary key,
   ManagerName varchar(100) not null
   );
   drop table 
   
   
   
   
   

   
   
   #4) Insert valid data:


