🐘 PostgreSQL SQL Practice Repository

A collection of SQL scripts written while learning PostgreSQL and relational database concepts. Each file focuses on a specific SQL topic, including database creation, table management, CRUD operations, constraints, operators, built-in functions, table relationships, views, functions, and stored procedures.

📚 About

This is not a single project — it's a growing collection of standalone .sql scripts created while practicing PostgreSQL. Each script demonstrates a particular database concept and serves as a reference for learning SQL.

📁 What's Inside

Database & Table Management

DatabaseCreation.sql — Database Creation
TableCreation.sql — Table Creation
AlterTable.sql — Altering tables (add column, rename column, rename table)
Drop.sql — Drop Statements
Constraints

Constraint.sql — Primary Key, Unique, Not Null, Default
Check.sql — CHECK Constraint
CRUD Operations

InsertOperation.sql — Insert Operation
UpdateOperation.sql — Update Operation
Delete.sql — Delete Operation
DisplayTableRows.sql — Display Table Rows
SQL Functions (Built-in)

Functions.sql — Built-in Functions
StringFunctions.sql — String Functions (UPPER, LOWER, CONCAT, CONCAT_WS, LENGTH, POSITION, REPLACE)
Conditional Logic

CaseExpression.sql — CASE Expressions
SQL Operators

Operators.sql — Arithmetic, Comparison, Logical, and Other SQL Operators
Relationships & Joins

RelationshipsAndJoins.sql — Foreign Keys, one-to-many relationships, and CROSS/INNER/LEFT/RIGHT JOIN practice using a Customer–Orders schema
EcommerceMiniProject.sql — Multi-table schema (Customers, Orders, Products, Order Items) demonstrating a many-to-many relationship resolved via a junction table, with a multi-table JOIN report query
joins_practice.sql — Many-to-many relationship (students–courses) resolved via an enrollment junction table. Covers INNER JOIN, LEFT/RIGHT JOIN with NULL preservation, COUNT with JOINs (0-count edge case), and the anti-join pattern (LEFT JOIN ... WHERE ... IS NULL) for finding unmatched rows on either side
Grouping & Aggregation

inventory_management_queries.sql — Combined practice script applying CRUD, constraints, string functions, CASE, GROUP BY, HAVING, aggregate functions (COUNT, MIN, MAX, SUM, AVG), ORDER BY, LIMIT, and DISTINCT on a mock inventory/products table
RollupSubtotals.sql — GROUP BY ROLLUP() to generate per-group subtotals plus a grand total row, using COALESCE to label the total row
Views

views_practice.sql — Creating a view (CREATE VIEW) over a multi-table JOIN, and confirming that views always reflect live data from the underlying tables (no stale/cached data)
Stored Procedures & Functions

procedures_practice.sql — Stored procedures (CREATE PROCEDURE, CALL) for actions that don't return data — updating a record's salary and email
bank_functions.sql — Functions with RETURNS TABLE(...) that return query results (RETURN QUERY, called via SELECT * FROM function_name(...)), including handling the "ambiguous column" error caused by RETURNS TABLE auto-generating OUT variables that can collide with table column names
Common Table Expressions & Window Functions

CTE.sql — Common Table Expressions (WITH clause) for breaking complex queries into readable, named subqueries, including chaining multiple CTEs
WindowFunctions.sql — Window functions (OVER, PARTITION BY, ORDER BY within a window) covering ranking (ROW_NUMBER, RANK, DENSE_RANK) and running/aggregate calculations without collapsing rows via GROUP BY
Applied Practice

inventory_management_queries.sql — (see above)
Each .sql file is independent and can be executed separately in PostgreSQL (except RelationshipsAndJoins.sql, EcommerceMiniProject.sql, joins_practice.sql, views_practice.sql, procedures_practice.sql, and bank_functions.sql, which each set up their own schema/objects and should be run top-to-bottom in a single session).

🎯 Purpose

Practice SQL syntax using PostgreSQL
Learn relational database concepts
Build a strong foundation for backend development
Create a personal reference library of SQL queries
Track my PostgreSQL learning journey
🚀 Technologies Used

PostgreSQL
SQL
pgAdmin
🛠️ How to Run

Open pgAdmin and connect to your PostgreSQL server.
Open the Query Tool.
Load any .sql file from this repository.
Execute the script to see the results.
Each SQL file is independent and can be run individually, except the relationship/join, views, and procedure/function scripts noted above.

📈 Learning Progress

✔ Database Creation ✔ Table Creation ✔ Alter Table (add/rename column, rename table) ✔ Drop Statements ✔ Constraints (Primary Key, Unique, Not Null, Default, Check) ✔ Insert Operation ✔ Update Operation ✔ Delete Operation ✔ Display Table Rows ✔ SQL Operators ✔ String Functions ✔ Built-in Functions ✔ CASE Expressions ✔ Aggregate Functions (COUNT, MIN, MAX, SUM, AVG) ✔ GROUP BY & HAVING ✔ ORDER BY, LIMIT, DISTINCT ✔ Foreign Keys ✔ Relationships (One-to-Many, Many-to-Many via junction table) ✔ JOINs (CROSS, INNER, LEFT, RIGHT) ✔ Anti-Join pattern (finding unmatched rows) ✔ GROUP BY ROLLUP (subtotals + grand total) ✔ Views (CREATE VIEW, live data reflection) ✔ Stored Procedures (CREATE PROCEDURE, CALL) ✔ Functions with RETURNS TABLE (CREATE FUNCTION, RETURN QUERY) ✔ Common Table Expressions (CTEs, chained CTEs) ✔ Window Functions (ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY)

More PostgreSQL concepts will be added as I continue learning.

📌 Upcoming Topics

Self-Join
Indexes
Transactions
Triggers
Subqueries (deeper practice — correlated subqueries)
Database Normalization
📌 Note

This repository is a practice log, not a complete database project. It is continuously updated as I learn new PostgreSQL concepts and write more SQL scripts.

👤 Author

Abdullah Aziz
