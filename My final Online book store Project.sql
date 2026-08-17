create database OnlineBookstore;

Drop table if exists Books;
Create table Books(
Book_id serial primary key,
title varchar(100),
author varchar(100),
genre varchar(50),
published_year int,
Price Numeric(10,2),
Stock int
);

Drop table if exists customers;
Create table Customers(
Customer_id serial primary key,
Name varchar(100),
Email varchar(100),
Phone varchar(50),
City varchar(50),
Country varchar(150)
);

Drop table if exists orders;
Create table Orders(
Order_id serial primary key,
Customer_id int references Customers(Customer_id),
Book_id int references Books(Book_id),
Order_date date,
Quantity int,
Total_amount numeric(10,2)
);
select * from Books;
select * from Customers;
select * from Orders;

--1) Retrieve all books in the "Fiction" genre
Select * from Books where genre='Fiction';

--2) Find books published after the year 1950
select * from Books where published_year>1950;

--3) List all customers from the Canada
select * from Customers where country='Canada';

--4) Show orders placed in November 2023
select * from Orders where Order_date between '2023-11-01' AND '2023-11-30';

--5) Retrieve the total stock of books available
select sum(stock) AS Total_stock from Books;

--6) Find the details of the most expensive book
select * from Books order by price desc limit 1;

--7) Show all customers who ordered more than 1 quantity of a book
select * from Orders where quantity>1; 

--8) Retrieve all orders where the total amount exceeds $20
select * from Orders where total_amount>20; 

--9) List all genres available in the Books table
select distinct genre from Books;

--10) Find the book with the lowest stock
select * from Books order by stock asc limit 1; 

--11) Calculate the total revenue generated from all orders
select sum(total_amount) as revenue from Orders;

--12) Total number of customers
SELECT COUNT(*) AS total_customers
FROM Customers;

--13) Total number of books
SELECT COUNT(*) AS total_books
FROM Books;

--14) Total number of orders
SELECT COUNT(*) AS total_orders
FROM Orders;

--Advance query Answers 
--1)Retrive the total number of books sold for each genre

select b.genre,sum(o.quantity) as total_books_sold
from Orders o 
join Books b on o.Book_id=b.book_id
group by b.genre;

--2)Find the average price of books in "Fantasy" genre
select avg(price) as Average_price 
from Books
where genre='Fantasy';

--3)List the customers who have placed at least 2 orders;
select customer_id,count(order_id) as order_count
from Orders
group by customer_id 
having count(order_id)>=2;

-------OR--------

select o.customer_id,c.name,count(o.order_id) as order_count
from Orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id, c.name
having count(order_id)>=2;

--4)Find the most frequently ordered Book
select o.book_id,b.title,count(o.order_id) as ORDER_COUNT 
from orders o
join books b on o.book_id=b.book_id
group by o.book_id,b.title
order by Order_COUNT desc limit 1;

--5)Show the top 3 expensive books of 'fantasy' genre;
select * from Books 
where genre = 'Fantasy' 
order by price desc limit 3;

--6) Retrieve the total quantity of books sold by each author;
select b.author,sum(o.quantity) as total_book_sold
from orders o
join books b on o.book_id=b.book_id
group by b.author;

--7)List the cities where customers who spent over $30 are located;
select distinct c.city,total_amount 
from orders o 
join customers c on o.customer_id=c.customer_id 
where o.total_amount>30;

--8)Find the customers who spent the most on orders
select c.customer_id,c.name, sum(o.total_amount) as Total_spent
from orders o 
join customers c on o.customer_id=c.customer_id 
group by c.customer_id,c.name
order by total_spent desc limit 1;

--9)Calculate the stock remaining after fulfulling all orders
select b.book_id,b.title,b.stock,coalesce(sum(o.quantity),0) as order_quantity, 
b.stock-coalesce(sum(o.quantity),0) as remaining_quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id order by b.book_id;