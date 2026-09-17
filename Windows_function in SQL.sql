## Window function 
-- syntax:
/*

select column_name1,
window_function(column_name2)
over([Partition by column_name3][Order by column_name4]) as new_column
from table_name;

*/
use bankingdb;
-- 1) Row number ()

select salary, row_number
() over (order by salary desc)
from employee_012;

-- assign rank to each employee w.r.to salary
select salary, rank
() over (order by salary desc)
from employee_012;

create table sales(
 sale_id int primary key	,
 employee_name varchar (50),
 department varchar (50),
 sale_date date,
 amount decimal (10,2)
 );
 
 
 create table sales(
 sale_id int primary key	,
 employee_name varchar (50),
 department varchar (50),
 sale_date date,
 amount decimal (10,2)
 );
 
 desc sales;
 insert into  sales ( sale_id, employee_name, department , sale_date, amount)
 values 
 (1,'amit','electronics','2026-01-05',50000),
 (2,'priya','electronics','2026-01-10',75000),
 (3,'rahul','electronics','2026-01-05',75000),
 (4,' sneha','electronics','2026-01-15',90000),
 (5,'vikas','clothing','2026-01-10',40000),
 (6,'neha', 'clothing','2026-01-19',60000),
 (7,'rohit','clothing','2026-10-10', 60000),
 (8,' pooja',' clothing','2026-01-10',85000),
 (9, 'karan','furniture','2026-02-10',30000),
 (10,'anjali','furniture','2026-02-10',55000);
 
 
 
 -- 1
-- 10assign row number 
 
 select 
 * ,row_number()over ( order by amount desc ) as 'ROW NUMBER',
 rank ()over ( order by amount desc ) as 'Rank',
 dense_rank () over ( order by amount desc ) as 'dense rank'
 from sales ;
 
 -- 2) partition by ( only applied on categorical column)--
 

 select department,amount ,
 rank () over (partition by department order by amount desc) as 'department rank',
  dense_rank () over (partition by department order by amount desc) as 'department dense  rank',
  sum(amount) 
  over (partition by department order by amount  desc ) as ' total amount'
 from sales ;
 
    select department,amount ,
 rank () over (partition by department order by amount desc) as 'department rank',
  dense_rank () over (partition by department order by amount desc) as 'department dense  rank',
  sum(amount) 
  over (partition by department order by amount  desc ) as ' running total department wise '
 from sales ;
 
 -- 3) percentage wise contribution of each department
 
 select
 employee_name,department ,amount,
  round (amount/sum(amount) over( partition by department)*100,2)  as 'depatmentwise_employee_contribution'
 from sales;
 
 
 
 -- lag()--> compare with the previous value --
 select 
 sale_id ,department, sale_date,amount , 
 lag ( amount) over (order by sale_date),
 lead ( amount) over (order by sale_date)
 
 from sales;
 
 -- lead():> compare current value with the next value -- 
 
 -- Running total with use of sum()--
 -- partition by only apply on categorical column--
 select sale_id,department,amount,
 sum(amount) over(partition by department order by sale_date)  as 'running_total'
 from sales;
 
 
 -- Average sale departmentwise--
 select sale_id,department,amount,
 concat('₹',round(avg(amount) over(partition by department order by sale_date),2))  as 'Average sales'
 from sales;
 
 -- First_Value and Last_Value function--
 -- First value is always apply on numerical column--
 
 select
 first_value(amount) over(partition by department order by amount desc) as 'First_value',
 last_value(amount) over(partition by department order by amount desc) as 'last_value'
 from  sales;
 
 SELECT DISTINCT
    department,
    FIRST_VALUE(amount) OVER(
        PARTITION BY department 
        ORDER BY amount DESC
    ) AS 'First_value',

    LAST_VALUE(amount) OVER(
        PARTITION BY department 
        ORDER BY amount DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'Last_value'
FROM sales;

 -- Ntile() -- divides roots into a specific numer of approxmately equal groups--
 select department ,amount,ntile(6) over (order by amount desc) as amount_6_quartile
 from sales;
 
 
    