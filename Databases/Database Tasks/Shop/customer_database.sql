/* An SQL script to create a new table within my shop database */

CREATE DATABASE IF NOT EXISTS shop_example;

USE shop_example;

CREATE TABLE IF NOT EXISTS customer_table (
customer_id int AUTO_INCREMENT,
customer_first_name char(30) NOT NULL,
customer_second_name char(50) NOT NULL,
customer_payment varchar(200) NOT NULL,
customer_address varchar(500) NOT NULL,
customer_mob char(15),
customer_email char(40) NOT NULL,
customer_dob date NOT NULL,
PRIMARY KEY(customer_id)
);

CREATE TABLE IF NOT EXISTS stock_table (
stock_id int AUTO_INCREMENT,
stock_name char(50) NOT NULL,
stock_description varchar(10000) DEFAULT 'This product has no description.' NOT NULL,
stock_quantity int(200) DEFAULT '0' NOT NULL,
stock_warehouse_address varchar(1000) NOT NULL,
PRIMARY KEY(stock_id)
);

CREATE TABLE IF NOT EXISTS order_table (
order_id int AUTO_INCREMENT,
order_stock_id int NOT NULL,
order_customer_id int NOT NULL,
order_quantity int(200) DEFAULT '0' NOT NULL,
order_date date NOT NULL,
payment_status varchar(1000) DEFAULT 'Awaiting Payment...' NOT NULL,
shipping_status varchar(1000) DEFAULT 'Order Not Shipped...' NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY(order_stock_id) REFERENCES stock_table(stock_id),
FOREIGN KEY(order_customer_id) REFERENCES customer_table(customer_id)
);
