# 🐘 PostgreSQL SQL Practice Repository

A collection of SQL scripts written while learning PostgreSQL and relational database concepts. Each file focuses on a specific SQL topic, including database creation, table management, CRUD operations, constraints, operators, built-in functions, and table relationships.

## 📚 About

This is not a single project — it's a growing collection of standalone `.sql` scripts created while practicing PostgreSQL. Each script demonstrates a particular database concept and serves as a reference for learning SQL.

## 📁 What's Inside

### Database & Table Management
- `DatabaseCreation.sql` — Database Creation
- `TableCreation.sql` — Table Creation
- `AlterTable.sql` — Altering tables (add column, rename column, rename table)
- `Drop.sql` — Drop Statements

### Constraints
- `Constraint.sql` — Primary Key, Unique, Not Null, Default
- `Check.sql` — CHECK Constraint

### CRUD Operations
- `InsertOperation.sql` — Insert Operation
- `UpdateOperation.sql` — Update Operation
- `Delete.sql` — Delete Operation
- `DisplayTableRows.sql` — Display Table Rows

### SQL Functions
- `Functions.sql` — Built-in Functions
- `StringFunctions.sql` — String Functions (UPPER, LOWER, CONCAT, CONCAT_WS, LENGTH, POSITION, REPLACE)

### Conditional Logic
- `CaseExpression.sql` — CASE Expressions

### SQL Operators
- `Operators.sql` — Arithmetic, Comparison, Logical, and Other SQL Operators

### Relationships & Joins
- `RelationshipsAndJoins.sql` — Foreign Keys, one-to-many relationships, and CROSS/INNER/LEFT/RIGHT JOIN practice using a Customer–Orders schema
- `EcommerceMiniProject.sql` — Multi-table schema (Customers, Orders, Products, Order Items) demonstrating a many-to-many relationship resolved via a junction table, with a multi-table JOIN report query

### Applied Practice
- `inventory_management_queries.sql` — Combined practice script applying CRUD, constraints, string functions, CASE, GROUP BY, HAVING, aggregate functions (COUNT, MIN, MAX, SUM, AVG), ORDER BY, LIMIT, and DISTINCT on a mock inventory/products table

Each `.sql` file is independent and can be executed separately in PostgreSQL (except `RelationshipsAndJoins.sql` and `EcommerceMiniProject.sql`, which each set up their own schema and should be run top-to-bottom in a single session).

## 🎯 Purpose

- Practice SQL syntax using PostgreSQL
- Learn relational database concepts
- Build a strong foundation for backend development
- Create a personal reference library of SQL queries
- Track my PostgreSQL learning journey

## 🚀 Technologies Used

- PostgreSQL
- SQL
- pgAdmin

## 🛠️ How to Run

1. Open pgAdmin and connect to your PostgreSQL server.
2. Open the Query Tool.
3. Load any `.sql` file from this repository.
4. Execute the script to see the results.

Each SQL file is independent and can be run individually, except the relationship/join scripts noted above.

## 📈 Learning Progress

✔ Database Creation
✔ Table Creation
✔ Alter Table (add/rename column, rename table)
✔ Drop Statements
✔ Constraints (Primary Key, Unique, Not Null, Default, Check)
✔ Insert Operation
✔ Update Operation
✔ Delete Operation
✔ Display Table Rows
✔ SQL Operators
✔ String Functions
✔ Built-in Functions
✔ CASE Expressions
✔ Aggregate Functions (COUNT, MIN, MAX, SUM, AVG)
✔ GROUP BY & HAVING
✔ ORDER BY, LIMIT, DISTINCT
✔ Foreign Keys
✔ Relationships (One-to-Many, Many-to-Many via junction table)
✔ JOINs (CROSS, INNER, LEFT, RIGHT)

More PostgreSQL concepts will be added as I continue learning.

## 📌 Upcoming Topics

- Self-Join
- Views
- Indexes
- Transactions
- Stored Procedures
- Triggers
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Database Normalization

## 📌 Note

This repository is a practice log, not a complete database project. It is continuously updated as I learn new PostgreSQL concepts and write more SQL scripts.

## 👤 Author

Abdullah Aziz
