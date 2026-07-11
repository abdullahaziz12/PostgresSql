-- ============================================
-- JOINS & RELATIONSHIPS PRACTICE (PostgreSQL)
-- Topic: One-to-Many relationship using Foreign Key
-- Author: Abdullah Aziz
-- ============================================

-- ---------------------------------------------
-- TABLE: CUSTOMER
-- Stores customer records (Parent table)
-- ---------------------------------------------
CREATE TABLE CUSTOMER (
    CUST_ID SERIAL PRIMARY KEY,        -- Auto-incrementing unique customer ID
    CUST_NAME VARCHAR(100) NOT NULL    -- Customer name (required field)
);

-- ---------------------------------------------
-- TABLE: ORDERS
-- Stores order records (Child table)
-- Linked to CUSTOMER via CUST_ID (Foreign Key)
-- This creates a One-to-Many relationship:
-- One customer can have many orders
-- ---------------------------------------------
CREATE TABLE ORDERS (
    ORDER_ID SERIAL PRIMARY KEY,       -- Auto-incrementing unique order ID
    ORDER_DATE DATE NOT NULL,          -- Date the order was placed
    PRICE DECIMAL(10,2) NOT NULL,      -- Order price (up to 10 digits, 2 decimal places)
    CUST_ID INTEGER NOT NULL,          -- References which customer placed the order
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID)  -- Enforces referential integrity
);

-- ---------------------------------------------
-- INSERTING SAMPLE DATA
-- ---------------------------------------------

-- Adding 3 customers (CUST_ID auto-generated: 1, 2, 3)
INSERT INTO CUSTOMER (CUST_NAME)
VALUES ('ABDULLAH'), ('USMAN'), ('UMAIR');

-- Adding 2 orders
-- Order 1 -> belongs to customer with CUST_ID = 1 (ABDULLAH)
-- Order 2 -> belongs to customer with CUST_ID = 2 (USMAN)
-- Note: UMAIR (CUST_ID = 3) has NO order yet -> useful for LEFT/RIGHT JOIN demo
INSERT INTO ORDERS (ORDER_DATE, PRICE, CUST_ID)
VALUES ('2024-03-12', 25000, 1),
       ('2026-04-11', 34000, 2);

-- ---------------------------------------------
-- BASIC SELECTS
-- ---------------------------------------------

-- View all customers
SELECT * FROM CUSTOMER;

-- View all orders
SELECT * FROM ORDERS;

-- ---------------------------------------------
-- CROSS JOIN
-- Combines every row of CUSTOMER with every row of ORDERS
-- Result rows = (rows in CUSTOMER) x (rows in ORDERS)
-- No relationship condition used -> not meaningful for real data,
-- just for understanding how JOIN multiplies rows
-- ---------------------------------------------
SELECT * FROM CUSTOMER CROSS JOIN ORDERS;

-- ---------------------------------------------
-- INNER JOIN
-- Returns only customers who HAVE placed an order
-- (matches rows where CUST_ID exists in both tables)
-- UMAIR will NOT appear here since he has no order
-- ---------------------------------------------
SELECT * FROM CUSTOMER C
INNER JOIN ORDERS O ON C.CUST_ID = O.CUST_ID;

-- ---------------------------------------------
-- LEFT JOIN
-- Returns ALL customers, whether they have an order or not
-- If no matching order exists, order columns show NULL
-- UMAIR WILL appear here with NULL order values
-- ---------------------------------------------
SELECT * FROM CUSTOMER C
LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID;

-- ---------------------------------------------
-- RIGHT JOIN
-- Returns ALL orders, whether they have a matching customer or not
-- If no matching customer exists, customer columns show NULL
-- (In this dataset, every order has a valid customer, so no NULLs appear)
-- ---------------------------------------------
SELECT * FROM CUSTOMER C
RIGHT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID;