/*=========================================================
        E-COMMERCE SALES ANALYTICS USING SQL (MySQL)
        Author : Gowri J Nair
        Project : E-Commerce Sales Analytics
=========================================================*/

-- =====================================================
-- DATABASE SETUP
-- =====================================================

CREATE DATABASE ecommerce_analytics;

USE ecommerce_analytics;

SHOW TABLES;

-- =====================================================
-- DATA EXPLORATION
-- =====================================================

-- View Customer Data
SELECT *
FROM olist_customers_dataset
LIMIT 10;

-- View Orders Data
SELECT *
FROM olist_orders_dataset
LIMIT 10;

-- View Order Items
SELECT *
FROM olist_order_items_dataset
LIMIT 10;

-- View Products
SELECT *
FROM olist_products_dataset
LIMIT 10;

-- View Payments
SELECT *
FROM olist_order_payments_dataset
LIMIT 10;

-- View Reviews
SELECT *
FROM olist_order_reviews_dataset
LIMIT 10;

-- View Product Category Translation
SELECT *
FROM product_category_name_translation
LIMIT 10;

-- =====================================================
-- DATASET OVERVIEW
-- =====================================================

-- Total Customers
SELECT COUNT(*) AS Total_Customers
FROM olist_customers_dataset;

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM olist_orders_dataset;

-- Total Products
SELECT COUNT(*) AS Total_Products
FROM olist_products_dataset;

-- Total Order Items
SELECT COUNT(*) AS Total_Order_Items
FROM olist_order_items_dataset;

-- Total Payments
SELECT COUNT(*) AS Total_Payments
FROM olist_order_payments_dataset;

-- Total Reviews
SELECT COUNT(*) AS Total_Reviews
FROM olist_order_reviews_dataset;

-- =====================================================
-- TABLE STRUCTURE
-- =====================================================

DESCRIBE olist_customers_dataset;

DESCRIBE olist_orders_dataset;

DESCRIBE olist_products_dataset;

DESCRIBE olist_order_items_dataset;

DESCRIBE olist_order_payments_dataset;

DESCRIBE olist_order_reviews_dataset;

-- =====================================================
-- BUSINESS OVERVIEW ANALYSIS
-- =====================================================

-- Q1. How many unique customers have we served?

SELECT COUNT(DISTINCT customer_unique_id) AS Total_Unique_Customers
FROM olist_customers_dataset;

----------------------------------------------------------

-- Q2. How many total orders have been placed?

SELECT COUNT(*) AS Total_Orders
FROM olist_orders_dataset;

----------------------------------------------------------

-- Q3. How many orders were successfully delivered?

SELECT COUNT(*) AS Delivered_Orders
FROM olist_orders_dataset
WHERE order_status = 'delivered';

----------------------------------------------------------

-- Q4. What percentage of orders were successfully delivered?

SELECT
ROUND(
COUNT(CASE
WHEN order_status = 'delivered'
THEN 1
END) * 100.0 / COUNT(*),
2
) AS Delivery_Percentage
FROM olist_orders_dataset;

----------------------------------------------------------

-- Q5. How many different product categories are available?

SELECT COUNT(DISTINCT product_category_name)
AS Total_Product_Categories
FROM olist_products_dataset;

----------------------------------------------------------

-- Q6. Which payment methods are most preferred by customers?

SELECT
payment_type,
COUNT(*) AS Total_Transactions
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY Total_Transactions DESC;