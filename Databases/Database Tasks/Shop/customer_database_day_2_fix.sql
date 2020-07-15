/* An SQL script to add foreign keys to the order_line table. */

USE shop_example;

ALTER TABLE order_line ADD fk_stock_id int;

ALTER TABLE order_line ADD fk_order_id int;

ALTER TABLE order_line ADD FOREIGN KEY(fk_stock_id) REFERENCES stock_table(stock_id);

ALTER TABLE order_line ADD FOREIGN KEY(fk_order_id) REFERENCES order_table(order_id);
