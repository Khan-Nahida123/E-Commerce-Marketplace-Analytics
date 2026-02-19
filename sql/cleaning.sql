-- =========================================
-- DATA CLEANING & VALIDATION SCRIPT
-- Purpose: post-import integrity audit
-- =========================================

-- -----------------------------------------
-- 1. Audit missing timestamps
-- (Python cleaning already handled conversion)
-- -----------------------------------------

SELECT *
FROM orders
WHERE order_approved_at IS NULL
   OR order_delivered_carrier_date IS NULL
   OR order_delivered_customer_date IS NULL;

-- -----------------------------------------
-- 2. Check invalid payment values
-- -----------------------------------------

SELECT *
FROM payments
WHERE payment_value <= 0;

-- -----------------------------------------
-- 3. Duplicate integrity checks
-- Should return ZERO rows
-- -----------------------------------------

SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT seller_id, COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- -----------------------------------------
-- 4. Foreign key integrity audit
-- Orphan reviews check
-- -----------------------------------------

SELECT r.review_id
FROM reviews r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

-- -----------------------------------------
-- 5. Critical NULL check
-- -----------------------------------------

SELECT *
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL;
