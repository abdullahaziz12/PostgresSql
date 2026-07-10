-- =====================================================
-- SQL Practice: DDL, CRUD, Constraints, Aggregates, 
-- String Functions, CASE (PostgreSQL)
-- =====================================================

-- ---------- DDL: Table Creation ----------

-- Create products table with primary key, NOT NULL, 
-- UNIQUE, and DEFAULT constraints
CREATE TABLE products (
    product_id     SERIAL PRIMARY KEY,           -- auto-incrementing unique identifier
    product_name   VARCHAR(100) NOT NULL,        -- required field
    category       VARCHAR(100),
    price          DECIMAL(10,2),                -- numeric with 2 decimal places
    stock_quantity INT DEFAULT 0,                -- defaults to 0 if not provided
    sku            VARCHAR(100) UNIQUE           -- no duplicate SKUs allowed
);

-- Add a new column to an existing table
ALTER TABLE products
ADD COLUMN supplier_email VARCHAR(100);

-- Rename a column
ALTER TABLE products
RENAME stock_quantity TO qty_available;

-- Rename the table itself
ALTER TABLE products RENAME TO inventory;

-- ---------- CRUD: Insert ----------

-- Insert 5 sample products across 3 categories (for GROUP BY testing)
INSERT INTO inventory (product_name, category, price, qty_available, sku, supplier_email)
VALUES
('iPhone 15', 'Electronics', 250000, 12, 'ELEC-001', 'supplier1@example.com'),
('Samsung Smartphone', 'Electronics', 180000, 0, 'ELEC-002', 'supplier1@example.com'),
('Basmati Rice 5kg', 'Grocery', 1200, 50, 'GROC-001', 'supplier2@example.com'),
('Olive Oil 1L', 'Grocery', 1500, 5, 'GROC-002', 'supplier2@example.com'),
('Cotton T-Shirt', 'Clothing', 800, 20, 'CLOTH-001', 'supplier3@example.com');

-- ---------- Read / Query ----------

-- View all rows
SELECT * FROM inventory;

-- Filter: products priced above 1000
SELECT * FROM inventory WHERE price > 1000;

-- Get unique category values (no duplicates)
SELECT DISTINCT category FROM inventory;

-- Sort products by price, highest first
SELECT * FROM inventory ORDER BY price DESC;

-- Top 3 most expensive products
SELECT * FROM inventory ORDER BY price DESC LIMIT 3;

-- Pattern match: product names containing "phone" (case-insensitive)
SELECT * FROM inventory WHERE product_name ILIKE '%phone%';

-- Total stock quantity per category
SELECT SUM(qty_available), category FROM inventory GROUP BY category;

-- Categories where the average price exceeds 500
-- (HAVING filters on aggregates AFTER grouping; WHERE cannot do this)
SELECT category, AVG(price) FROM inventory GROUP BY category HAVING AVG(price) > 500;

-- Cheapest and most expensive product price in one query
SELECT MIN(price), MAX(price) FROM inventory;

-- Total number of products in the table
SELECT COUNT(product_id) FROM inventory;

-- ---------- String Functions ----------

-- Convert product names to uppercase
SELECT UPPER(product_name) FROM inventory;

-- Combine product name and category into one string, separated by "-"
SELECT CONCAT_WS('-', product_name, category) FROM inventory;

-- Get character length of each product name
SELECT LENGTH(product_name) FROM inventory;

-- ---------- CASE Statement ----------

-- Categorize stock levels into readable status labels
SELECT qty_available,
CASE
    WHEN qty_available = 0 THEN 'Out of Stock'
    WHEN qty_available > 0 AND qty_available <= 10 THEN 'Low Stock'
    ELSE 'In Stock'
END AS StockStatus
FROM inventory;

-- ---------- Update / Delete ----------

-- Update price of a specific product by its ID
UPDATE inventory
SET price = 1000
WHERE product_id = 5;

-- Delete product(s) that are out of stock
DELETE FROM inventory WHERE qty_available = 0;