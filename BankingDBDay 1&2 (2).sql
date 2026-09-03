
create database n325_db;

show databases;
-- to display database --
-- to select the database
use n325_db;

-- command to create table

CREATE table IF NOT exists employee
( 
emp_id int, emp_name varchar (20),salary double , hiring_date date
); 

-- describe the table--
desc employee;
describe employee;

-- insert records in table--
insert into employee(emp_id,emp_name,hiring_date) value(1,'suresh','2026-08-27');
-- display/retrieve table--
select *from employee;
create database Banking_db;
use Banking_db;
create table customers
(
Customer_ID int,
First_name varchar(50),
Last_name varchar (50),
Email varchar (100),
phone varchar(15)
);

desc Customers;

-- to add new column 'accountcreationdate'---> DATE--
alter table Customers
add AccountCreationDate date ;

desc Customers;

insert into Customers(Customer_ID, First_name,Last_name,Email,phone,AccountCreationDate)
value (101,'Raj','Kurve','raj_k@gamail.com',9881004242,'2025-10-25');

-- to retrive data from table--
-- syntax: select *from <table_name>;--
select *from Customers;

select First_Name,Email,AccountCreationDate
from customers;



