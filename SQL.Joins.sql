 use n325_db;
create table customers (
customer_id int primary key	,
customer_name varchar(50),
city varchar(50)
);

insert into customers
values 
(101,'Amit','Nagpur'),
(102,'Priya','Pune'),
(103, 'Rahul', 'Mumbai'),
(104,'Sneha','Delhi'),
(105,'Vikas','Nashik');


create table orders(
order_id int primary key,
customer_id int,
product varchar(50),
amount decimal (10,2)
);
 insert into orders 
 values
 (1,101,'Laptop',55000),
 (2,102,'Mobile',25000),
 (3,102,'Mouse',1500),
 (4,103,'Keyboard',3000),
 (5,103,'Monitor',12000),
 (6,106,'Printer',18000);
 
 SELECT * FROM orders;
 
 ##  INNER JOINS : RETUrns only the records that have matching values in both table 
 
select x.*,y.*
from customers as x
inner join orders as y 
on  x. customer_id = y.customer_id;
 
 select x.*,y. amount,y.product
 from customers as x
 inner join orders as y
 on x. customer_id= y.customer_id;
 
 
select 
c. Customer_id,
 c. customer_name,
  o.product ,
  concat('₹',o.amount)
  from customers c
  inner join orders o 
  on c.customer_id=o.customer_id;
 
 
 
 
 ## LEFT JOINS 
 
 select
 c. Customer_id,
 c. customer_name,
  o.product ,
  concat('₹',o.amount)
  from customers c
  LEFT join orders o 
  on c.customer_id=o.customer_id; 
  
  
   ## RIGHT JOIN 
   select
 c. Customer_id,
 c. customer_name,
  o.product ,
  concat('₹',o.amount)
  from customers c
  RIGHT  join orders o 
  on c.customer_id=o.customer_id; 
  
  ## CROSS JOIN / CARTESIAN JOIN : it will return all possible combination of the rows from the join table.
  
   SELECT
 c.*,
  o.*
  from customers c
  CROSS join orders o; 
  
  ## Self Join:
  -- 1) A self join means joining a table with itself.
  -- 2) 
  
  create table employees_01(
      employee_id int Primary key,
      employee_name varchar(50),
      manager_id int
  );
  
  Insert into employees_01
  values
  (1,'Amit',null),
  (2,'Priya',1),
  (3,'Rahul',1),
  (4,'Sneha',2),
  (5,'Rockey',3);
  
  select 
  e.employee_name as employee,
  m.employee_name as manager
  from employees_01 e
  left join employees_01 m
  on e.manager_id = m.employee_id;
  
  show tables;
  
  -- Example  2 
  
  Create table employee_new(
  emp_id int primary key, 
  emp_name varchar(50), 
  department varchar(100)
  );
  
  desc employee_new;
  
  insert into employee_new 
  values
  (1,'Rahul','IT'),
  (2,'Priya','HR'),
  (3,'Hitesh','IT'),
  (4,'Gavrav','HR'),
  (5,'Amit','Finance');
  
  select e_n1.emp_name,e_n2.emp_name,e_n1.department,e_n2.department
  from employee_new e_n1
  join employee_new e_n2
  on e_n1.department = e_n2.department;
  
  # full outer joins: Mysql doesnot support , but we can make full outer join by union of left join and right join.
  -- this will give records from the both tables,including unmatched records.--
  -- full join or full outer join it will  return matching and non-matching rows from both tables.--
  
  select 
  c.customer_id,
  c.customer_name,
  o.order_id,
  o.product
  from customers c
  left join orders o
  on c.customer_id = o.customer_id;
  
  select
  c.customer_id,
    c.customer_name,
  o.order_id,
  o.product
  from customers c
  right join orders o
  on c.customer_id = o.customer_id;
  
  
  --  By using it will return  all matching and non matching value from both the table.--
  
  select 
  c.customer_id,
  c.customer_name,
  o.order_id,
  o.product
  from customers c
  left join orders o
  on c.customer_id = o.customer_id
  
  UNION
  
  select
  c.customer_id,
  c.customer_name,
  o.order_id,
  o.product
  from customers c
  right join orders o
  on c.customer_id = o.customer_id;
  

-- inner join: it will  return all matching rows from both  the table.--
## joins with WHERE Clause. 
-- Where clause is  use to  pass the condition on row or record
-- having clause is use to filter the group--
select 
c.*,o.product,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.amount>12000;

select 
c.*,o.product,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.product in ('laptop','monitor') and c.city='nagpur';

## group by 

select c.*,sum(o.amount),o.product
from customers c
inner join orders 
on c.customer_id = o.customer_id 
group  by o.customer_id,c.customer_id,o.product;

select sum(amount) from orders group by customer_id;

## JOINS 

  
  
   
