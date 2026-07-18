# 🐘 PostgreSQL SQL Practice Repository

A collection of SQL scripts written while learning PostgreSQL and relational database concepts. Each file focuses on a specific topic — database and table management, CRUD operations, constraints, operators, built-in functions, relationships, views, functions, stored procedures, and indexing.

---

## 📚 About

This is not a single project — it's a growing collection of standalone `.sql` scripts created while practicing PostgreSQL. Each script demonstrates a particular database concept and serves as a personal reference for learning SQL.

---

## 📁 What's Inside

### Database & Table Management
| File | Description |
|---|---|
| `DatabaseCreation.sql` | Database creation |
| `TableCreation.sql` | Table creation |
| `AlterTable.sql` | Altering tables (add column, rename column, rename table) |
| `Drop.sql` | Drop statements |

### Constraints
| File | Description |
|---|---|
| `Constraint.sql` | Primary Key, Unique, Not Null, Default |
| `Check.sql` | CHECK constraint |

### CRUD Operations
| File | Description |
|---|---|
| `InsertOperation.sql` | Insert operation |
| `UpdateOperation.sql` | Update operation |
| `Delete.sql` | Delete operation |
| `DisplayTableRows.sql` | Display table rows |

### SQL Functions (Built-in)
| File | Description |
|---|---|
| `Functions.sql` | Built-in functions |
| `StringFunctions.sql` | String functions (UPPER, LOWER, CONCAT, CONCAT_WS, LENGTH, POSITION, REPLACE) |

### Conditional Logic
| File | Description |
|---|---|
| `CaseExpression.sql` | CASE expressions |

### SQL Operators
| File | Description |
|---|---|
| `Operators.sql` | Arithmetic, comparison, logical, and other SQL operators |

### Relationships & Joins
| File | Description |
|---|---|
| `RelationshipsAndJoins.sql` | Foreign keys, one-to-many relationships, and CROSS/INNER/LEFT/RIGHT JOIN practice using a Customer–Orders schema |
| `EcommerceMiniProject.sql` | Multi-table schema (Customers, Orders, Products, Order Items) demonstrating a many-to-many relationship resolved via a junction table, with a multi-table JOIN report query |
| `joins_practice.sql` | Many-to-many relationship (Students–Courses) resolved via an enrollment junction table. Covers INNER JOIN, LEFT/RIGHT JOIN with NULL preservation, COUNT with JOINs (0-count edge case), and the anti-join pattern (`LEFT JOIN ... WHERE ... IS NULL`) for finding unmatched rows |

### Grouping & Aggregation
| File | Description |
|---|---|
| `inventory_management_queries.sql` | Combined practice applying CRUD, constraints, string functions, CASE, GROUP BY, HAVING, aggregate functions (COUNT, MIN, MAX, SUM, AVG), ORDER BY, LIMIT, and DISTINCT on a mock inventory/products table |
| `RollupSubtotals.sql` | GROUP BY ROLLUP() to generate per-group subtotals plus a grand total row, using COALESCE to label the total row |

### Views
| File | Description |
|---|---|
| `views_practice.sql` | Creating a view (CREATE VIEW) over a multi-table JOIN, and confirming that views always reflect live data from the underlying tables |

### Stored Procedures & Functions
| File | Description |
|---|---|
| `procedures_practice.sql` | Stored procedures (CREATE PROCEDURE, CALL) for actions that don't return data — updating a record's salary and email |
| `bank_functions.sql` | Functions with `RETURNS TABLE(...)` that return query results (RETURN QUERY, called via `SELECT * FROM function_name(...)`), including handling the "ambiguous column" error caused by auto-generated OUT variables colliding with table column names |

### Common Table Expressions & Window Functions
| File | Description |
|---|---|
| `CTE.sql` | Common Table Expressions (WITH clause) for breaking complex queries into readable, named subqueries, including chaining multiple CTEs |
| `WindowFunctions.sql` | Window functions (OVER, PARTITION BY, ORDER BY within a window) covering ranking (ROW_NUMBER, RANK, DENSE_RANK) and running/aggregate calculations without collapsing rows via GROUP BY |

### Indexing
| File | Description |
|---|---|
| `index.sql` | Indexing performance test on a 500-row dummy dataset — table creation, CSV import, `EXPLAIN ANALYZE` comparison of Seq Scan vs Index Scan before/after creating a UNIQUE index on `email`, a non-existent-value lookup test, and a 200k-row scale-up test to see a clearer performance gap |
| `dummy_employees.csv` | 500 rows of dummy employee data (`name, lastname, company, post, salary, email`) with guaranteed-unique emails, used as the sample dataset for `indexing_test.sql` |

### Applied Practice
| File | Description |
|---|---|
| `inventory_management_queries.sql` | *(see Grouping & Aggregation above)* |

> Each `.sql` file is independent and can be executed separately, **except**: `RelationshipsAndJoins.sql`, `EcommerceMiniProject.sql`, `joins_practice.sql`, `views_practice.sql`, `procedures_practice.sql`, `bank_functions.sql`, and `indexing_test.sql` — these set up their own schema/objects and should be run top-to-bottom in a single session.

---

## 🎯 Purpose

- Practice SQL syntax using PostgreSQL
- Learn relational database concepts
- Build a strong foundation for backend development
- Create a personal reference library of SQL queries
- Track my PostgreSQL learning journey

---

## 🚀 Technologies Used

- PostgreSQL
- SQL
- pgAdmin / psql

---

## 🛠️ How to Run

1. Open pgAdmin (or `psql`) and connect to your PostgreSQL server.
2. Open the Query Tool (or a terminal session for `psql`).
3. Load any `.sql` file from this repository.
4. Execute the script to see the results.

Each SQL file is independent and can be run individually, except the relationship/join, views, procedure/function, and indexing scripts noted above.

**Note on `indexing_test.sql`:** it imports `dummy_employees.csv` using `\copy`, which only works inside the `psql` terminal (not the pgAdmin/DBeaver query editor). Update the file path in the script to match where you've saved the CSV locally before running.

---

## 📈 Learning Progress

- ✔ Database Creation
- ✔ Table Creation
- ✔ Alter Table (add/rename column, rename table)
- ✔ Drop Statements
- ✔ Constraints (Primary Key, Unique, Not Null, Default, Check)
- ✔ Insert Operation
- ✔ Update Operation
- ✔ Delete Operation
- ✔ Display Table Rows
- ✔ SQL Operators
- ✔ String Functions
- ✔ Built-in Functions
- ✔ CASE Expressions
- ✔ Aggregate Functions (COUNT, MIN, MAX, SUM, AVG)
- ✔ GROUP BY & HAVING
- ✔ ORDER BY, LIMIT, DISTINCT
- ✔ Foreign Keys
- ✔ Relationships (One-to-Many, Many-to-Many via junction table)
- ✔ JOINs (CROSS, INNER, LEFT, RIGHT)
- ✔ Anti-Join pattern (finding unmatched rows)
- ✔ GROUP BY ROLLUP (subtotals + grand total)
- ✔ Views (CREATE VIEW, live data reflection)
- ✔ Stored Procedures (CREATE PROCEDURE, CALL)
- ✔ Functions with RETURNS TABLE (CREATE FUNCTION, RETURN QUERY)
- ✔ Common Table Expressions (CTEs, chained CTEs)
- ✔ Window Functions (ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY)
- ✔ Indexes (Seq Scan vs Index Scan, UNIQUE index, EXPLAIN ANALYZE)

More PostgreSQL concepts will be added as I continue learning.

---

## 📌 Upcoming Topics

- Self-Join
- Transactions
- Triggers
- Subqueries (deeper practice — correlated subqueries)
- Database Normalization

---

## 📌 Note

This repository is a practice log, not a complete database project. It is continuously updated as I learn new PostgreSQL concepts and write more SQL scripts.

---

## 👤 Author

**Abdullah Aziz**
