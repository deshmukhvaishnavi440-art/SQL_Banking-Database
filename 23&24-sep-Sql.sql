use ShoppingDB;

create table users(
	user_id int primary key,
    username varchar(50),
    country varchar(50),
    followers int);
    
create table posts (
	post_id int primary key,
    user_id int,
    post_text varchar(255), 
    foreign key (user_id) references users(user_id)
);

insert into users
(user_id, username, country, followers)
values
(1, 'Rahul', 'India', 800000),
(2, 'Priya', 'India', 600000),
(3, 'Amit', 'India', 300000),
(4, 'Sneha', 'USA', 900000),
(5, 'John', 'India', 700000),
(6, 'Emma', 'USA', 400000),
(7, 'Rohan', 'UK', 200000),
(8,'Sophia','UK',100000);

INSERT INTO posts
(post_id, user_id, post_text)
VALUES
(101, 1, 'Learning SQL '), 
(102, 1, 'Learning Python'),
 (103, 2, 'Data Science'),
 (104, 4, 'Machine Learning'), 
(105, 4, 'AI Tutorial'), 
(106, 5, 'Power BI'), 
(107, 7, 'My First Post');

-- Type 1--
## scalar subquery: a sclar subquery returns one row and one column, i.e a single value.
## a single -row subquery returns only one row/value

-- 1) Find average followers
select avg(followers) as 'Average followers'
from users;

-- 2) Find the username whose followers are less than equals to average followers

select username,followers
from users
where followers>(
select avg(followers)
from users
);

-- 3) find the user with maximum followers
select username,followers,country
from users
where followers=(
select max(followers)
from users
);

-- 3) find the user with minimum followers
select username,followers,country
from users
where followers=(
select min(followers)
from users
);

-- 4) find the user above 500000 followers and from which country 
select username,followers,country
from users
where followers>500000;

-- using a  sub-query
select username,followers
from users
where followers>(
select 500000
);

-- Type -2
## Multiple-row subquery
/*
A multiple-row subquery returns multiple rows. 
*/
## IN with subquery

select country ,avg(followers)
from users
group by country
having avg(followers)>500000;

-- 1) Find users from countries whose average followers exceed 500000

select username ,country,followers
from users
where country in (
select country
from users
group by country
having avg(followers)>500000
);

-- 2) NOT IN with subquery 
-- find the user who are not from countries having average followers above 500000.
 
 select username ,country,followers 
 from users
where country not in (
select country
from users
group by country
having avg(followers)>500000
);

## 3) ANY with subquery
-- Any compares a value with at least one value returned by the subquery.

-- find the  users whose followers are greater than at least one of the these values. 
select username,followers
from users
where followers > any (
select followers
from users
where country ='UK'
);

## 4) All with subquery
-- All requires the comparison to be  true for every value returned by the subquery.
 select followers
 from users
 where country ='UK';
 
 -- Finds users whose followers are greater than every UK USER'S FOLLOWERS.
 select username,followers
 from users
 where followers> All(
 select followers
 from users
 where country='UK'
 );
 
 ## Exist with subquery
 -- Exists checks weather the subquery returns at least one record.
 -- find users who have created at least one post
 select username,user_id
 from users u
 where exists (
 select 1
 from posts p
 where p.user_id= u.user_id
 );
 
 ## Not Exist with subquery
 -- find users who have not created at least one post
 select username,user_id
 from users u
 where not exists (
 select 1
 from posts p
 where p.user_id= u.user_id
 );
 
 -- 24 sep 2026 --
 
 ## Type -3
 ## Correlated subquery: Acorrelated subquery references a column from the outer query and is evaluate for each outer row
 
 -- Find users whose followers are greater than their country's average.
 select *from users;
 
 select country,avg(followers)
 from users
 group by country order by avg(followers) desc;
 
 select
 u1.username,
 u1.country,
 u1.followers
 from users u1
 where u1.followers > (
 select avg(u2.followers)
 from users u2 
 where u2.country = u1.country
 );
 
 -- Find users whose followers are smaller than their country's average
 select
 u1.username,
 u1.country,
 u1.followers
 from users u1
 where u1.followers <(
 select avg(u2.followers)
 from users u2 
 where u2.country = u1.country
 );
 
 select
 u1.username,
 u1.country,
 u1.followers
 from users u1
 where u1.followers =(
 select avg(u2.followers)
 from users u2 
 where u2.country = u1.country
 );
 -- It does not show any result because there is no same followers .
 
 ## Subquery in Form
 /*
 A subquery inside FROM is calleda :
 1) Derived Table 2) Table subquery 3) Inline view
 
 It behaves like a temporary table and must have as alias in Mysql.
 */
 
 select
 country,
 avg(followers) as avg_followers
 from users
 group by country;
 
 select 
 country_data.country,
 country_data.avg_followers
 from (
  select country,
 avg(followers) as avg_followers
 from users
 group by country
 ) as country_data
 where country_data.avg_followers> 500000;
 
 select *
 from(
 select country, 
 count(user_id) as total_users,
 avg(followers) as avg_followers
 from users
 group by country
 ) as country_summary where country in('USA','India');
 
 ## Derived the table using WHERE clause
 select*
 from(
 select
 country,
 avg(followers) as avg_followers
 from users
 group by country
 ) as country_data
 where avg_Followers > 500000;
 
 ## subquery in WHERE clause
 -- subquery in where clause are commonly used by filtering
 select distinct user_id from posts;
 
 -- Find user who have posts
 
 select user_id,username
 from users
 where user_id in (
 select distinct user_id from posts);
 
 -- find users without posts
 select user_id,username
 from users
 where user_id not in (
 select distinct user_id from posts);
 
 ## Nested Subquery: A Subquery can contain another subquery.
 
 select username,followers
 from users
 where followers >(
 select avg(followers)
 from users
 where country =(
 select country
 from users
 where username='Rahul'
 )
 );