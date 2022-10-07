


-- EXERCISE 1


-- Write an SQL query to return:
-- 				1. all the products in the database
-- 				2. name
-- 				3. unit price
-- 				2. discounted price of 5%


-- SAMPLE SOLUTION:

USE sql_store;

SELECT 
			 name,
             unit_price,
             round(unit_price-(unit_price*0.05) ,2) AS discount_price
FROM products


-- EXERCISE 2

-- Write an SQL query to return the orders that were made before 2019


-- SOLUTION

SELECT *

FROM orders
WHERE order_date < '2019-01-01'



-- EXERCISE 3

-- From the order_items table , get the items:
-- for oder number 6 
-- where the total price is greater than $20
-- and display the unit price

-- SAMPLE SOLUTION:


SELECT 
			order_id,
            quantity,
            unit_price,
            quantity*unit_price AS price

FROM order_items
WHERE order_id = 6 AND quantity*unit_price > 20





-- EXERCISE 4

-- Return products with
	-- quantity in stock equal to 49, 38, 72

-- SAMPLE SOLUTION:


SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72)







-- EXERCISE 5

-- Return CUSTOMERS born
	-- between 1/1/1990 and 1/1/2000

-- SAMPLE SOLUTION:

SELECT*
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'












-- EXERCISE 6

-- Get the customers whose 
	-- 1. addresses contain TRAIL or AVENUE
	-- 2. phone numbers end with 9
    
    
    
-- SOLUTION

-- 1. addresses contain TRAIL or AVENUE

SELECT*
FROM customers
WHERE address LIKE '%trail%' OR 
			 address LIKE  '%avenue%'


	-- 2. phone numbers end with 9
    
SELECT* 
FROM customers
WHERE phone LIKE '%9'



-- EXERCISE 7

-- Get the customer whose 
	-- first names are ELKA or AMBUR
    -- last names end with EY or ON
    -- last names starts with MY or contains SE
    -- last names contain B followed by R or U
    
    
-- SOLUTION

	-- first names are ELKA or AMBUR

SELECT*
FROM customers
WHERE first_name REGEXP 'elka|ambur'
    
    
    
        -- last names end with EY or ON
        
SELECT*
FROM customers
WHERE last_name REGEXP 'ey$|on$'
    
    
-- last names starts with MY or contains SE


SELECT*
FROM customers
WHERE last_name REGEXP '^my|se'
    
    
    -- last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'b[r|u]'

-- 

SELECT *
FROM customers
WHERE last_name REGEXP 'br|bu'




-- EXERCISES 8

	-- get all the orders that are not shipped
    
    
-- SOLUTION

SELECT *
FROM orders
WHERE shipped_date IS NULL
    
--

SELECT *
FROM orders
WHERE shipper_id IS NULL
    
    
    
    
-- EXERCISE 9

	-- get the top 3 loyal customers
    
    
    
-- SOLUTION

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3
    



-- EXERCISE 10
-- write a query to join the order_items table with the products table and return 
		-- product ID
        -- product name
        -- quantity (purchased)
        -- unit price
-- NB: use alias to simplify your code


-- SOLUTION

SELECT 
				oi.product_id,
                p.name, 
                oi.quantity,
                oi.unit_price,
                oi.quantity *oi.unit_price AS price
FROM order_items oi
JOIN products p
				ON oi.product_id = p.product_id

    
    
    
            
-- EXERCISE 11
-- write a query and join the payments table with the payment_methods table as well as the clients
   -- producce a report that shows the payment with more details such as the name of the client, and the payment method.
   -- nb: the tables are found in the sql_invoicing database
   
   
   -- SOLUTION
   
USE sql_invoicing;

SELECT 
			p.invoice_id,
            p.amount,
            c.name,
            pm.name AS 'payment mode'
            
FROM payments p
JOIN clients c
			ON p.client_id = c.client_id
JOIN payment_methods pm
			ON p.payment_method = pm.payment_method_id;
            
            


-- EXERCISE 12
-- write a query that produces a table with the following results:
		-- product_id, name(i.e. name of product), quantity(you can get that from the order items table)
		-- return the product even if it has never been ordered

-- SOLUTION

USE sql_store;


SELECT
			p.product_id,
            p.name,
            oi.quantity
FROM products p
LEFT JOIN order_items oi
		  ON p.product_id = oi.product_id;




-- EXERCISE 13
	-- using the sql_invoicing database, write a query that returns:
        -- date
        -- amount
        -- client
        -- name (i.e name of payment menthod)
        
-- SOLUTION
USE sql_invoicing;


SELECT
			p.date,
            p.amount,
            c.name AS client,
            pm.name AS payment_mode
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
			ON p.payment_method = pm.payment_method_id



			











   