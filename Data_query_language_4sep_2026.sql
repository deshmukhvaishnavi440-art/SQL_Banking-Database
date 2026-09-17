use bankingdb;

Create table Student(
 student_id varchar(50),
 student_name varchar(50),
 address varchar(50),
 city varchar(50)
 );
 
 insert into student values(1,'Shashank','RJPM','Lucknow');
 
 alter table Student add column DOB date;
 
 desc Student;
 
 alter table Student modify column student_name varchar(100);

-- drop column 'city' --
-- syntax: alter table <table_name> drop column <column_name>;

 alter table Student drop column city;
 
 create table if not exists teacher(
 teacher_id int(50),
 teacher_name varchar(100),
 hiring_date date,
 age int(50),
 salary int(100)
 );
 
 desc teacher;
 
 insert into teacher values(1,'Kamal','2021-02-09',28,50000),
 (2,'Reshma','2020-12-12',34,67000),(3,'Ujjwal','2023-11-23',25,15000),(4,'Jay','2025-11-10',30,56000);
 
 select*from teacher;
 
 select*from student;
 
 desc student;
 
 alter table  Student add constraint pk_student_id primary key(student_id);
 
 -- rename  column --
 -- syntax: alter table <table_name> rename column <old_column_name> to <new_column_name>; --
 
 alter table Student rename column student_name to  Stud_name;
 
 insert into Student 
 values('s01','Gaurav','Dharampeth','2025-10-10'),
 ('s02','Kunal','Reshimbagh','1999-10-08'),
 ('s03','Farhan','Mominpura','1997-12-10'),
 ('s04','Vaibhav','Vayusena Nagar','2000-11-14'),
 ('s05','Vishal','Pratab Nagar','2009-08-07'),
 ('s06','Kumar','Ravi nagar','2005-02-05'),
 ('s07','Dinesh','Sitabuldi','1996-12-12'),
 ('s08','Tanushree','Medical Square','2009-12-13');
 
 -- how to count total records of table--
 -- alias declerationc--
 
 select count(*) as 'Number of Student'
 from Student; 
 
 select Stud_name 
 from Student;
 
 select DOB, month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),curdate()as'Today Date',
 datediff(curdate(),DOB)as'Number of days till today',year(datediff(curdate(),DOB))as'year'
 from Student;
 
 select  month(DOB) from Student;

 
 select *from employee_012;
 
 select department ,count(*)as  'Number of employee'
 from employee_012
 group by department
 having count(EmployeeID)>=2
 order by sum(salary) desc
 Limit 2;
 
 
 ## aggregation function in SQL--
 -- total no of employee--
 Select count(*)as 'Total employee' from employee_012;
 
 -- Total salary--
 Select sum(salary)as 'Total salary' from employee_012;
 
 -- Total salary department wise--
 Select Department,sum(salary)as 'Total salary' from employee_012 group by department;
 
 -- Average salary departmentwise--
 -- aggregation only apply on numeric column--
 select Department, concat("₹",round(avg(salary),0)) as 'Average salary'
 from employee_012 group  by department;
 
 --  Aggregation function on salary departmentwise --
 select concat("₹",round(sum(salary),0)) as 'Total salary',
 concat("₹",round(max(salary),0)) as 'Maximum salary',
 concat("₹",round(min(salary),0)) as 'Minimum salary',
 count(*) as 'Number of Employee'
 from employee_012
 group by department
 order by avg(salary);
 
 
 ## Pattern Matching
 -- '%' is use to start/end or any were in the name by any charachter --
 -- find employee whose name start with 'R' --
 
 select *from employee_012
 where EmployeeName like 'R%';
 
 select *from employee_012
 where EmployeeName like '%a';
 
 select *from employee_012
 where EmployeeName like '%a%';
 
-- find employee name whose second charachter is 'a' '_a%'
select *from employee_012
where EmployeeName like '_a%';

-- find the city which have 5 letters--
select city from employee_012
where city like '_____';

-- find city which starts with 'M'
select city from employee_012
where city like 'M%';
 
 select *from employee_012
 where city ='Mumbai';
 
 desc employee_012;