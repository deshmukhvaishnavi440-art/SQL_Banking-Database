Create Database InstagramDB;


USE InstagramDB;

Create Table Users (
user_id int auto_increment  Primary key,
username varchar(50) not null unique,
email varchar(100) not null unique,
first_name varchar(50),
last_name varchar(50),
created_at timestamp default current_timestamp
);


-- 2. Profile Table
-- One-to-one relationship with users


Create table Profiles (
profile_id int auto_increment primary key,
user_id int unique not null,
bio varchar(255),
profile_picture varchar(255),
date_of_birth date,

foreign key (user_id)
references Users (user_id)
on delete cascade
);


-- 3. Post table --
-- One User can create many posts 
-- one-to-many relationship
--  ====================================================

Create table Posts (
post_id int auto_increment primary key,
user_id int not null,content text,
image_url varchar(255), created_date timestamp default current_timestamp,

foreign key (user_id)
references Users(user_id)
on delete cascade
);

-- 4. comment table
-- weak entity
-- depend on users and posts
-- =============================================

create table Comments(
comment_id int auto_increment primary key,
user_id int not null,
post_id int not null,
comment_text varchar(500),
created_date timestamp default current_timestamp,

foreign key (user_id)
references Users(user_id)
on delete cascade,
 
 foreign key (post_id)
 references Posts(post_id)
 on delete cascade
 );
 
 
 -- 5. likes table
 -- creates many-to-many relationship
 -- Between users and posts
 -- =========================
  
 create table Likes (
 user_id int,
 post_id int,
 liked_date timestamp default current_timestamp,
 
 primary key (user_id, post_id),
 
 foreign key(user_id)
 references Users(user_id)
 on delete cascade,
 
 foreign key(post_id)
 references Posts(post_id)
 on delete cascade
 );
 
 # inser data:
 Insert into Users
 (username, email, first_name,last_name)
 values
 ('hitesh123','hitesh@gmail.com','Hitesh','pandey'),
 ('rahul_01','rahul@gamil.com','Rahul','Sharma'),
 ('priya_99','priya@gmail.com','Priya','Patil');
 
 insert into Profiles
 (user_id,bio,date_of_birth)
 values
 (1,'Data Science Trainer','1995-05-10'),
 (2,'Software Developer','1998-08-15'),
 (3,'Data Analyst','1999-08-15');
 
 insert into Posts
 (user_id,content,image_url)
 values
 (1,'Learning SQL Database Relationships!', 'sql.jpg'),
 (1,'Today we learn foreign key','Foreignkey.jpg'),
 (2,'Hello from Instagram Database!','instagram.jpg');
 
 select *from Posts;
 
 -- Insert comments
 insert into Comments
 (user_id, post_id, comment_text)
 values
 (2,1,'Great explanation!'),(3,1,'Very useful topic.'),
 (1,3,'welcome to the platform!');
 
 select *from Comments;
 
 desc Comments;
 desc Likes;
 
 -- insert likes
 insert into Likes
 (user_id,post_id)
 values (2,1),(3,1),(1,3),(3,3);
 
 select *from likes;
 