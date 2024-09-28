create table staff(
  staff_id int primary key,
  staff_name text,
  salary real
);

insert into staff values
  (1, 'David', 25000),
  (2, 'Mary', 30000)
;

create table customers(
  customer_id int primary key,
  customer_name text
);

insert into customers values
  (1, 'Anna'),
  (2, 'John');

create table menu(
  menu_id int primary key,
  menu_name text,
  menu_price real
);
insert into menu values
  (1, 'pizza', 100),
  (2, 'hotdog', 50),
  (3, 'coke', 20);

create table branch(
  branch_id int primary key,
  branch_name text
);

insert into branch values
  (1, 'BKK'),
  (2, 'CNX');

create table orders(
  staff_id int,
  customer_id int,
  menu_id int,
  branch_id int,
  order_date date
);

insert into orders values
  (1, 1, 1, 1,'2024-02-01'),
  (1, 1, 2, 1,'2024-02-01'),
  (2, 2, 3, 2,'2024-02-02'),
  (2, 2, 1, 2,'2024-02-02'),
  (2, 2, 2, 2,'2024-02-03');
.mode table
.header on

select * from staff;
select * from customers;
select * from menu;
select * from branch;
select * from orders;

-- Aggregate Function & GROUP BY 
-- find branch with most orders
select branch_id, 
  count(branch_id) as branch_count
From orders
group by branch_id
order by branch_count desc
limit 1;

SELECT branch.branch_name, 
  COUNT(*) AS total_orders
FROM orders
INNER JOIN branch  ON orders.branch_id = branch.branch_id
GROUP BY branch.branch_name
ORDER BY total_orders DESC
LIMIT 1;

--WITH CLAUSE
--find total pizza on Feb02
WITH 
  FEB_02 AS (
    SELECT *
    FROM orders
    WHERE order_date = '2024-02-02'
  ),
  menu_pizza AS (
    SELECT *
    FROM menu
    WHERE menu_name = 'pizza'
  )

SELECT 
  SUM(m.menu_price) AS total_price
FROM FEB_02 o
JOIN menu_pizza m ON o.menu_id = m.menu_id;

--subquerie
--find total hotdog sold
select 
  count(menu_id) AS Total_hotdog
from (
    select *
    from orders
    Where menu_id = 2
    );
