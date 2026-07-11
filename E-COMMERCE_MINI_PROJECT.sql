-- ============================================
-- E-COMMERCE MINI PROJECT (PostgreSQL)
-- Topic: Multi-table relationships (One-to-Many + Many-to-Many via junction table)
-- Author: Abdullah Aziz
-- ============================================

CREATE DATABASE E_storedb;

-- ---------------------------------------------
-- TABLE: CUSTOMERS
-- Parent table, holds customer records
-- ---------------------------------------------
CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

-- ---------------------------------------------
-- TABLE: ORDERS
-- One customer can place many orders (One-to-Many)
-- ---------------------------------------------
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    cust_id INTEGER,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

-- ---------------------------------------------
-- TABLE: PRODUCTS
-- Independent catalog table
-- ---------------------------------------------
CREATE TABLE products (
    p_id SERIAL PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL
);

-- ---------------------------------------------
-- TABLE: ORD_ITEMS (Junction / Bridge table)
-- Connects ORDERS <-> PRODUCTS
-- This resolves the Many-to-Many relationship:
-- One order can contain many products,
-- and one product can appear in many orders.
-- ---------------------------------------------
CREATE TABLE ord_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    p_id INTEGER NOT NULL,
    FOREIGN KEY (p_id) REFERENCES products(p_id),
    quantity INTEGER NOT NULL
);

-- ---------------------------------------------
-- SAMPLE DATA: CUSTOMERS
-- ---------------------------------------------
INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex');
    -- Note: Alex has no orders yet -> good for LEFT JOIN practice later

-- ---------------------------------------------
-- SAMPLE DATA: ORDERS
-- ---------------------------------------------
INSERT INTO orders (order_date, cust_id)
VALUES
    ('2024-01-01', 1),  -- Raju first order
    ('2024-02-01', 2),  -- Sham first order
    ('2024-03-01', 3),  -- Paul first order
    ('2024-04-04', 2);  -- Sham second order

-- ---------------------------------------------
-- SAMPLE DATA: PRODUCTS
-- ---------------------------------------------
INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00);

-- ---------------------------------------------
-- SAMPLE DATA: ORDER ITEMS
-- Each row = one product line inside one order
-- ---------------------------------------------
INSERT INTO ord_items (order_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Order 1 (Raju): 1 Laptop
    (1, 4, 2),  -- Order 1 (Raju): 2 Cables
    (2, 1, 1),  -- Order 2 (Sham): 1 Laptop
    (3, 2, 1),  -- Order 3 (Paul): 1 Mouse
    (3, 4, 5),  -- Order 3 (Paul): 5 Cables
    (4, 3, 1);  -- Order 4 (Sham): 1 Keyboard

-- ---------------------------------------------
-- FINAL REPORT QUERY
-- Joins all 4 tables to build a full order summary:
-- Customer name, product name, quantity, order date,
-- unit price, and total bill per line item.
--
-- Join chain: ord_items -> products -> orders -> customers
-- ---------------------------------------------
SELECT
    c.cust_name,
    p.p_name,
    oi.quantity,
    o.order_date,
    p.price,
    (oi.quantity * p.price) AS total_bill
FROM ord_items oi
JOIN products p  ON p.p_id = oi.p_id
JOIN orders o    ON o.order_id = oi.order_id
JOIN customers c ON c.cust_id = o.cust_id;  