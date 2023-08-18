###Path for the Project: - "C:\Shital\E-commerce-project-springBoot-main" 

create database springproject;
use springproject;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

drop table categories ;
CREATE TABLE categories (
  categoryid int(11) NOT NULL,
  name varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select*from categories;
INSERT INTO `categories` (`categoryid`, `name`) VALUES
(6, 'category6'),
(8, 'category7'),
(11, 'fruit');

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 select*from login;

INSERT INTO `login` (`id`, `password`, `username`) VALUES
(1, '123', '1');

select*from login;

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `categoryid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `products` VALUES
(default, 'apple', 'https://cdn.pixabay.com/photo/2023/03/01/20/07/flowers-7823941__480.jpg', 8, 5, 30, 10, 'red python'),
(default, 'dfgdg', 'https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662__480.jpg', 10, 7275275, 24, 27, ' ajlf; '),
(default, 'dfgdg', 'https://cdn.pixabay.com/photo/2016/10/05/14/13/flowers-1716747__480.jpg', 15, 7275275, 24, 27, 'adfadf');

select*from products;
drop table users;

CREATE TABLE `users` (
  `user_id` varchar(100) not null,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role` varchar(45) NOT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `email` varchar(110) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `mobile` varchar(12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE users MODIFY user_id varchar(100);
desc users;


INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `enabled`, `email`,`address`) VALUES
('jay1', 'jay', '123', 'ROLE_USER', 1, 'gajerajay9@gmail.com','kolkata'),
('admin1', 'admin', '123', 'ROLE_ADMIN', 1, '20ceuos042@ddu.ac.in','keral');
INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `enabled`, `email`,`address`) VALUES
('5', 'abc', '098', 'ROLE_ADMIN', 1, 'shital@gmail.com','pune');

select*from users;
desc users;
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`categoryid`);

desc products;
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;


ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`) ON DELETE CASCADE;
COMMIT;

ALTER TABLE `users` 
CHANGE COLUMN `role` `role` VARCHAR(250) NULL;

ALTER TABLE `users` CHANGE COLUMN `role` `role` VARCHAR(250) NOT NULL DEFAULT 'ROLE_USERS';
desc users;
select*from users;
select*from categories;
select*from products;
select*from login;

truncate table users;
flush privileges;
SET PASSWORD FOR root@localhost ='Newuser123';

insert into categories values(10,'SHOPP');
insert into categories(name) values('SHOPP');
desc users;
desc products;

ALTER TABLE products MODIFY image varchar(10000);
alter table users add column address varchar(100);
delete from users where user_id="5";
SELECT COUNT(user_id) AS Users FROM users;

 drop table cart;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL primary key auto_increment,
  `product_id` int(11) NOT NULL ,
  `user_id` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

select*from cart;
insert into cart values(default,30,'aditi1','shoes','C:\Users\skhatte\Desktop\downdoad.jpg',4500,890);
insert into cart values(default,34,'aditi1','shopp','data:image/jpeg;base64,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',588,500);
insert into cart values(default,35,'aditi1','table','https://t3.ftcdn.net/jpg/04/63/06/84/360_F_463068437_ZTWJ7pBfJ4syqLewJsQKXgsdQKRSopX6.jpg',450,900);
insert into cart values(default,36,'sneha1','abc','https://img.lovepik.com/element/40152/6651.png_1200.png',500,890);
insert into cart values(default,34,'sneha1','pqr','data:image/jpeg;base64,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',900,1500);
insert into cart values(default,36,'sneha1','ast','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvR7X2xAYEDOisUUVqpQG1TIQL-sg1q6oA3TSep80iwQ&s',600,1000);
insert into cart values(default,30,'jay1','ast','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvR7X2xAYEDOisUUVqpQG1TIQL-sg1q6oA3TSep80iwQ&s',600,1000);
INSERT INTO `products` VALUES(default, 'sun', 'https://cdn.pixabay.com/photo/2017/05/18/15/05/chipmunk-2323827__480.jpg', 8, 5, 300, 100, 'orange - red');


desc products;
desc categories;
desc cart;
desc users;

 select sum(price) from cart where user_id='sneha1';
 select * from cart where user_id in (select user_id from users where username="jay");
 
 select*from users;
 select*from cart;
select*from products;

select count(*) from cart where user_id in (select user_id from users where username='sneha'); 
SELECT COUNT(*) FROM categories;
select count(*) from users;

##To start the primary id specific column with the initial is 1;
alter table products AUTO_INCREMENT=1; 
##Truncate is for delete all the entries from table and make table empty
truncate table products;

##To start the primary id specific column with the initial is 1;
alter table categories AUTO_INCREMENT=1; 
truncate table categories;


alter table categories add column description varchar(400); 
select*from categories;
delete from users where user_id='admin1';
alter table users add column mobile varchar(12);
select*from users;
select*from cart;
delete from users where user_id='ganesh1';
update users set mobile='9890116054' where user_id='sneha1';
delete from users where user_id='j11';

select * from cart where user_id in (select user_id from users where username='sneha');
select*from products where categoryid in(select categoryid from categories where name='keyboard-mouse');

show tables;
select* from products;
desc users;
select*from cart;
select* from cart where user_id='jay1';
update cart set quantity=2, total=2000 where user_id='jay1';
select*from users;

select*from cart where user_id='jay1' and product_id='1';
alter table cart add column total int;

desc categories;
drop table login;
------------------------------------------------
alter table products modify column image varchar(10000);
delete from products where id=31;

desc products;
desc cart;
desc categories;
##------------------product and carts table For File upload file and display it through the folder images-------------------------------
CREATE TABLE `product` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(10000),
    `categoryid` INT(11) NOT NULL,
    `quantity` INT(11) NOT NULL,
    `price` INT(11) NOT NULL,
    `weight` INT(11) NOT NULL,
    `description` TEXT NOT NULL,
    FOREIGN KEY (`categoryid`) REFERENCES `categories1` (`categoryid`) ON DELETE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
desc product;

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL primary key auto_increment,
  `product_id` int(11) NOT NULL ,
  `user_id` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(10000),
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `quantity` int,
  `total` int,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
desc carts;

CREATE TABLE categories1 (
  categoryid int(11) primary key auto_increment,
  name varchar(255) NOT NULL,
  description varchar(400)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
desc categories1;
##---------------------------------------------------------------------------------------------------------------
delete from users;
delete from customers;
delete from carts;
delete from product;
delete from products;
delete from cart;
delete from categories;
delete from categories1;
#--------------------------To Start the id's from initial 1-----------------------------------------------------
select*from users;
alter table categories1 AUTO_INCREMENT=1;
alter table product AUTO_INCREMENT=1;
alter table carts AUTO_INCREMENT=1;
alter table cart AUTO_INCREMENT=1;
alter table products AUTO_INCREMENT=1;
#--------------------------------------------------------------------------------
select*from categories1;
select*from product;
select*from users;
select*from product where categoryid in(select categoryid from categories1 where name='Mobile');
##-------------------------
select*from carts;
select*from categories1;
select*from users;
#--------------------------------------------------------------------------------
desc users;
desc categories;

delete * from users where username="shital";