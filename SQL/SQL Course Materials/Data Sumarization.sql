
-- 					--------------------------------------- DATA SUMMARIZATION ---------------------------------------





-- --------------------------------------- Aggregate Functions ---------------------------------------

-- Aggregate functions provide a summary of your data

-- Aggregate 				Function	Descriptions

-- count()						It returns the number of rows, including rows with NULL values in a group.
-- sum()						It returns the total summed values (Non-NULL) in a set.
-- average()					It returns the average value of an expression.
-- min()						It returns the minimum (lowest) value in a set.
-- max()						It returns the maximum (highest) value in a set.

-- 




-- Let's create a new table for this lessson;

-- Execute the below statement to create an new_employee table:

USE sql_hr;

CREATE TABLE new_employee(  
														name varchar(45) NOT NULL,    
														occupation varchar(35) NOT NULL,    
														working_date date,  
														working_hours varchar(10)  
);  



-- Execute the below statement to insert the records into the employee table:

INSERT INTO new_employee 
VALUES    
				('Robin', 'Scientist', '2020-10-04', 5),  
				('Warner', 'Engineer', '2020-10-04', 7),  
				('Peter', 'Actor', '2020-10-04', 13),  
				('Marco', 'Engineer', '2020-10-04', 11),  
				('Brayden', 'Teacher', '2020-10-04', 9),  
				('Antonio', 'Business', '2020-10-04', 11);  


SELECT * FROM new_employee






-- Count() Function


SELECT COUNT(name) FROM new_employee;     




-- Sum() Function



SELECT SUM(working_hours) AS "Total working hours" FROM new_employee; 



-- AVG() Function


 SELECT AVG(working_hours) AS "Average working hours" FROM new_employee; 
 
 
 -- MIN() Function
 
 SELECT MIN(working_hours) AS Minimum_working_hours FROM new_employee;
 
 -- MAX() Function
 
 SELECT MAX(working_hours) AS Maximum_working_hours FROM new_employee;
 
 
 -- Put all together
 
 
 SELECT COUNT(name),
				SUM(working_hours),
				AVG(working_hours),
                MIN(working_hours),
                MAX(working_hours)
 FROM new_employee;
				
 

SELECT* FROM new_employee
                
                
-- Count() Function in detail


-- COUNT() with WHERE

SELECT COUNT(*) FROM new_employee WHERE working_hours>10; 

-- COUNT() with DISTINCT

 SELECT COUNT(DISTINCT occupation) FROM new_employee; 
 




USE sql_store;

   
SELECT * FROM customers;


-- HAVING() 

SELECT first_name, last_name, state, points
FROM customers
HAVING  points > 1000


-- EXERCISE 
-- Explore the SQL GROUP BY clause  
-- GROUP BY :  https://www.mysqltutorial.org/mysql-having.aspx
-- ROLL UP : https://www.mysqltutorial.org/mysql-rollup/





-- -------------------------------------	SQL FUNCTIONS	-----------------------------------------------

-- LENGTH( )
-- CHAR_LENGTH, CHARACTER_LENGTH, and LENGTH, all three functions give the same result which is the number of characters in the given string. All three take one parameter which is a string value.
-- 

SELECT first_name, CHAR_LENGTH(first_name)

FROM employees

-- You can use the other LENTH functions to getsame results


SELECT first_name, CHAR_LENGTH(first_name), CHARACTER_LENGTH(first_name), LENGTH(first_name) FROM employees
		
 
 
 
 -- CONCAT( )
-- The concatenation of string is a very commonly used technique in all programming languages. SQL provides it too. CONCAT is used to join two or more values into a single string value, it can join any type of data.
-- 

SELECT CONCAT(first_name,last_name, salary) FROM employees

-- you can add ' ' to add spaces in between them

SELECT CONCAT(first_name, ' ',last_name, ' ', ': ',salary) FROM employees

-- 

-- FORMAT( )
-- It formats the floating-point number to specified decimal places and returns the value as a string.
-- Parameters:
			-- number: Required. The number to be formatted
			-- decimal_places: Required. The number of decimal places for number. If this parameter is 0, this function returns a string with no decimal places
            
            
SELECT salary, FORMAT(salary, 1) FROM employees



-- INSERT( )
-- Used to insert a string in place of another string starting from a specified position until a certain number of characters.

-- string: Required. The string that will be modified
-- position: Required. The position where to insert string2
-- number: Required. The number of characters to replace
-- string2: Required. The string to insert into the string


SELECT INSERT('abcght', 4, 2, 'def'); -- at position 4 of the string 'abcgh', we want to replace 2 strings


SELECT job_title, INSERT(job_title, 1, 7, 'General') FROM employees


-- we can be more specific by specifying the particular id we want to update

SELECT job_title, INSERT(job_title, 1, 7, 'General') FROM employees
WHERE employee_id = 33391




-- LOCATE( )

SELECT employee_id, job_title,  LOCATE('Executive', job_title) FROM employees

-- you can use this to get the position of what you want to update

-- e.g you can now update executive at position 8 at employee 80529. nb: executive is 9 characters so we use 9 below

SELECT job_title, INSERT(job_title, 8, 9, 'Manager') FROM employees
WHERE employee_id = 80529


-- UCASE( ), LCASE( )
-- Very straight forward, UCASE to convert string to uppercase and LCASE to convert a string into lowercase.

SELECT job_title, first_name, LCASE(job_title), UCASE(first_name) FROM employees


SELECT * FROM employees
