/* A script to insert data into our database - Add entries into my database. */

INSERT into customer_table (customer_first_name, customer_second_name, customer_payment,
  customer_address, customer_mob, customer_email, customer_dob)

VALUES ('Josh', 'Higginson', 'BarclayCard', 'England', 11111111111, 'josh@me.com', 1996-09-12),
('James', 'Agar', 'Lloyds', 'Australia', 2222222222, 'james@me.com', 1994-12-12),
('Bilbo', 'Baggins','Bank of Mum and Dad','The Shire', 33333333333, 'bilbo@me.com', 1745-05-11);

INSERT into stock_table (stock_name, stock_quantity, stock_price, stock_warehouse_address)
  VALUES ('Magic Set', 78, 10, 'Leicester'), ('The One Ring', 1, 200, 'Mordor'), ('Tennis Racket', 456, 15, 'Azerbaijan');

INSERT into order_table (order_date)
  VALUES (2010-11-12), (2010-12-12), (2011-01-01);

INSERT into order_line (order_quantity, order_subtotal)
  VALUES (4,20), (1,40), (2,60);

/* Deleting entry from customers, and one from orders..

DELETE FROM order_table WHERE shipping status='Shipped';

DELETE FROM customer_table WHERE customer_email='bilbo@me.com';

*/

/* Updating one field..

UPDATE customer_table
SET customer_payment="Gimli's Bank LTD"
WHERE customer_email="bilbo@me.com";

*/
