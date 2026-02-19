-- =========================================
-- Why LOAD DATA INFILE instead of import wizard?
-- =========================================
-- The MySQL Workbench import wizard is known to be unstable
-- with large CSV datasets and can freeze or fail silently.
-- For a production-style pipeline, I used LOAD DATA INFILE,
-- which is faster, deterministic, and widely used in industry.
--
-- This method ensures:
-- ✔ predictable performance on large files
-- ✔ strict schema validation
-- ✔ reproducible imports
-- ✔ automation-friendly workflow
--
-- The goal was to build a reliable ingestion pipeline,
-- not a GUI-dependent manual process.
-- =========================================

USE ecommerce;

-- =========================================
-- Customers table import
-- Cleaned dataset imported from preprocessing pipeline
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers_clean.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Verify import success
SELECT COUNT(*) FROM customers;

-- =========================================
-- Sellers table import
-- Marketplace seller master data
-- Source: cleaned sellers dataset
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sellers_clean.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Verify import
SELECT COUNT(*) FROM sellers;

-- =========================================
-- Products table import
-- Product catalog metadata
-- Cleaned and normalized product attributes
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Verify import
SELECT COUNT(*) FROM products;

-- =========================================
-- Orders table import
-- Core transaction lifecycle table
-- Handles NULL timestamps safely
-- =========================================
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
order_id,
customer_id,
order_status,
order_purchase_timestamp,
@order_approved_at,
@order_delivered_carrier_date,
@order_delivered_customer_date,
order_estimated_delivery_date
)
SET
order_approved_at = NULLIF(@order_approved_at, ''),
order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
order_delivered_customer_date = NULLIF(@order_delivered_customer_date, '');

-- Verify import
SELECT COUNT(*) FROM orders;

-- =========================================
-- Order items import
-- Bridge table linking orders and products
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items_clean.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Verify import
SELECT COUNT(*) FROM order_items;

-- =========================================
-- Payments table import
-- Financial transactions per order
-- =========================================
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments_clean.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Verify import
SELECT COUNT(*) FROM payments;


-- =========================================
-- Reviews table import
-- Customer feedback and ratings
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reviews_clean.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Verify import
SELECT COUNT(*) FROM reviews;

-- =========================================
-- Geolocation table import
-- Aggregated ZIP code coordinate lookup
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/geolocation_clean.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Verify import
SELECT COUNT(*) FROM geolocation;

-- =========================================
-- Category translation import
-- Portuguese → English category mapping
-- =========================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/category_translation_clean.csv'
INTO TABLE category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Verify import
SELECT COUNT(*) FROM category_translation;






