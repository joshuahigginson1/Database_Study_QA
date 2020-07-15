/* An SQL script to create new tables within my shop database. */

CREATE DATABASE IF NOT EXISTS shop_example;

USE shop_example;

SET foreign_key_checks = 0;

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
  stock_price int(100) NOT NULL,
  stock_warehouse_address varchar(1000) NOT NULL,
  PRIMARY KEY(stock_id)
);

CREATE TABLE IF NOT EXISTS order_table (
  order_id int AUTO_INCREMENT,
  order_date date NOT NULL,
  payment_info varchar(1000) DEFAULT 'Awaiting Payment Info...' NOT NULL,
  shipping_info varchar(1000) DEFAULT 'Order Not Shipped...' NOT NULL,
  PRIMARY KEY(order_id)
);

/* Creates an order line table in order to resolve m:m link between stock
and order. FKeys are then added later on within the fix.sql file. */

CREATE TABLE IF NOT EXISTS order_line (
  orderline_id int AUTO_INCREMENT,
  order_quantity int NOT NULL,
  order_subtotal int NOT NULL,
  PRIMARY KEY(orderline_id)
);
