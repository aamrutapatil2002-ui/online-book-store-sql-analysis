# 📚 Online Book Store SQL Analysis

## 📌 Project Overview

This project analyzes an **Online Book Store database using MySQL and SQL** to generate meaningful business insights from books, customers, and orders data.

The project demonstrates how SQL can be used to analyze sales performance, customer spending, book demand, revenue, and inventory.

---

## 🎯 Project Objectives

- Analyze book sales and revenue
- Identify high-performing book genres
- Identify high-value customers
- Rank customers based on total spending
- Find the best-selling books within each genre
- Analyze inventory and stock levels
- Generate business-oriented insights using SQL

---

## 🗂️ Database Structure

The project uses three main tables:

### 1. Customers

| Column | Description |
|---|---|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| email | Customer email |

### 2. Books

| Column | Description |
|---|---|
| book_id | Unique book identifier |
| title | Book title |
| author | Book author |
| genre | Book genre |
| price | Book price |
| stock | Available stock |

### 3. Orders

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| customer_id | Customer reference |
| book_id | Book reference |
| quantity | Number of books ordered |
| order_date | Date of order |

---

## 🔍 Business Questions Analyzed

### 1. Sales Analysis by Genre

Which book genres generate the highest sales volume?

Used:

- JOIN
- SUM()
- GROUP BY
- ORDER BY

---

### 2. Customer Spending Analysis

Which customers contribute the most revenue to the bookstore?

Used:

- INNER JOIN
- SUM()
- GROUP BY
- ORDER BY

---

### 3. Customer Ranking

Who are the highest-spending customers?

Used:

- RANK()
- Window Functions
- JOIN
- GROUP BY
- Aggregate Functions

---

### 4. Best-Selling Book by Genre

What is the best-selling book within each genre?

Used:

- CTE
- RANK()
- PARTITION BY
- JOIN
- GROUP BY

---

### 5. Inventory Analysis

How much inventory remains for each book after considering ordered quantities?

Used:

- LEFT JOIN
- COALESCE()
- SUM()
- GROUP BY

---

### 6. Revenue Analysis by Genre

Which genres contribute the most revenue?

Used:

- JOIN
- SUM()
- GROUP BY
- ORDER BY

---

## 🛠️ Tools & Technologies

- MySQL
- SQL
- MySQL Workbench

### SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- Subqueries
- CTEs
- Window Functions
- RANK()
- PARTITION BY
- COALESCE()

---

## 📊 Key Analysis Areas

The project focuses on:

- 📈 Sales Performance
- 💰 Revenue Analysis
- 👥 Customer Spending
- 🏆 Customer Ranking
- 📚 Best-Selling Books
- 📦 Inventory Analysis
- 📖 Genre Performance

---

## 📁 Project Files

```text
online-book-store-sql-analysis/
│
├── README.md
├── Online_Book_Store_SQL_Project.sql
└── Online_Book_Store_SQL_Project.pdf