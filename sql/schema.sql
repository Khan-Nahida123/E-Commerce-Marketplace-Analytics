-- =========================================
-- Create database
-- =========================================
-- Main ecommerce analytics database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- =========================================
-- Customers table
-- =========================================
-- Stores customer identity and location info
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,     -- unique order customer ID
    customer_unique_id VARCHAR(50),          -- real customer identity (repeat buyer tracking)
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);


-- =========================================
-- Orders table
-- =========================================
-- Core transaction table (order lifecycle)
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,

    -- Relationship: order belongs to a customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- =========================================
-- Products table
-- =========================================
-- Product catalog metadata
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);


-- =========================================
-- Sellers table
-- =========================================
-- Marketplace seller information
CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);


-- =========================================
-- Order Items table
-- =========================================
-- Bridge table: connects orders ↔ products ↔ sellers
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,   -- item sequence inside an order
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),

    -- Composite primary key (multi-item orders)
    PRIMARY KEY (order_id, order_item_id),

    -- Relationships
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);


-- =========================================
-- Payments table
-- =========================================
-- Payment transactions per order
CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,   -- payment step number
    payment_type VARCHAR(20),
    payment_installments INT,
    payment_value DECIMAL(10,2),

    -- Composite key for multi-payment orders
    PRIMARY KEY (order_id, payment_sequential),

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- =========================================
-- Reviews table
-- =========================================
-- Customer feedback and ratings
CREATE TABLE reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME,

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- =========================================
-- Geolocation table
-- =========================================
-- ZIP code lookup with coordinates
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT PRIMARY KEY,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);


-- =========================================
-- Category translation table
-- =========================================
-- Portuguese → English product category mapping
CREATE TABLE category_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);










