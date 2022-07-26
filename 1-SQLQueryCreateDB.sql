
/****** Object: Database [sales_DB] - Script Date: 27/12/2021 - Creator:Raafat Abdelkader ******/

USE [master];
GO
CREATE DATABASE [sales_DB]
--ON 
--( NAME = 'sales_DB', FILENAME = N'{FilePath}sales_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
--LOG ON 
--( NAME = 'sales_DB_log', FILENAME = N'{FilePath}sales_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
USE sales_DB;
GO
CREATE SCHEMA production;
GO
CREATE SCHEMA sales;
GO
													/***1-Sales***/
-->Tabelle : kundendaten

CREATE TABLE sales.customers(
customer_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(35) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone VARCHAR(16) NULL,
email VARCHAR(50) NOT NULL,
street VARCHAR(40) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR (25) NOT NULL ,
zip_code VARCHAR(5) NOT NULL)
GO

-->Tabelle : kundenbestellungen
CREATE TABLE sales.orders(
order_id INT IDENTITY(1,1) PRIMARY KEY,
customer_id int NOT NULL,
-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
order_status TINYINT NOT NULL,
order_date DATE NOT NULL,
required_date DATE NOT NULL,
shipped_date DATE NOT NULL,
store_id VARCHAR(15) NOT NULL,
staff_id VARCHAR(10)NOT NULL,

CONSTRAINT order_customer_fk foreign key (customer_id) REFERENCES sales.customers(customer_id),
CONSTRAINT order_status_check CHECK (order_status in (1,2,3,4))
)
GO

-->Tabelle : Mitarbeiter
CREATE TABLE sales.staffs(
staff_id VARCHAR(10) PRIMARY KEY,
first_name VARCHAR(35) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone VARCHAR(16) NOT NULL,
email VARCHAR(50) NOT NULL,
store_id VARCHAR(15) NOT NULL,
manager_id VARCHAR(10) NOT NULL,
)
GO

-->Tabelle : Stores
CREATE TABLE sales.stores(
store_id VARCHAR(15) PRIMARY KEY,
store_name VARCHAR(50) NOT NULL,
phone VARCHAR(16) NOT NULL,
email VARCHAR(50) NOT NULL,
street VARCHAR(40) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR (25) NOT NULL,
zip_code VARCHAR (5)NOT NULL
)
GO

-->Tabelle : order_items
CREATE TABLE sales.order_items(
item_id VARCHAR(15),
order_id INT ,
product_id VARCHAR(15) NOT NULL,
quantity INT NOT NULL,
list_price DECIMAL (10, 2) NOT NULL,
discount DECIMAL (4, 2) NULL DEFAULT 0,
 CONSTRAINT orderItems_pk PRIMARY KEY (order_id,item_id) 
)
GO

													/***2-production***/
-->Tabelle : Kategories
CREATE TABLE production.categories(
category_id VARCHAR(20) PRIMARY KEY,
category_name VARCHAR(30) NOT NULL)
GO
-->Tabelle : produkte
CREATE TABLE production.products(
product_id VARCHAR(15) PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
brand_id VARCHAR(15) NOT NULL,
category_id VARCHAR(20) NOT NULL,
model_year int NOT NULL,
list_price DECIMAL (10, 2) NOT NULL,
)
GO
-->Tabelle : stocks
CREATE TABLE production.stocks(
store_id VARCHAR(15),
product_id VARCHAR(15),
quantity INT NOT NULL
CONSTRAINT stocks_PK PRIMARY KEY (store_id,product_id)
)
GO
-->Tabelle : brands
CREATE TABLE production.brands(
brand_id VARCHAR(15) PRIMARY KEY,
brand_name VARCHAR(25) NOT NULL
)
GO

--Relationships erstellung 
ALTER TABLE sales.orders 
ADD CONSTRAINT orders_staff_fk FOREIGN KEY(staff_id) REFERENCES sales.staffs(staff_id)
GO
ALTER TABLE sales.orders 
ADD CONSTRAINT orders_store_fk FOREIGN KEY(store_id) REFERENCES sales.stores(store_id)
Go
ALTER TABLE sales.order_items
ADD CONSTRAINT orderItems_order_fk FOREIGN KEY (order_id) REFERENCES sales.orders(order_id)
GO
ALTER TABLE sales.order_items
ADD CONSTRAINT orderItems_product_fk FOREIGN KEY (product_id) REFERENCES production.products(product_id)
GO
ALTER TABLE production.products
ADD CONSTRAINT products_category_fk FOREIGN KEY (category_id) REFERENCES production.categories(category_id)
Go
ALTER TABLE production.products
ADD CONSTRAINT products_brand_fk FOREIGN KEY (brand_id) REFERENCES production.brands(brand_id)
Go
ALTER TABLE production.stocks
ADD CONSTRAINT stocks_store_fk FOREIGN KEY (store_id) REFERENCES sales.stores(store_id)
Go
ALTER TABLE production.stocks
ADD CONSTRAINT stocks_product_fk FOREIGN KEY (product_id) REFERENCES production.products(product_id)
GO
ALTER TABLE sales.staffs
--ALTER COLUMN manager_id VARCHAR(10)
ADD CONSTRAINT straff_Manager_fk FOREIGN KEY (manager_id) REFERENCES sales.staffs(staff_id)
GO
ALTER TABLE sales.staffs
ADD CONSTRAINT straff_store_fk FOREIGN KEY (store_id) REFERENCES sales.stores(store_id)
GO

--use master
--drop database sales_DB;