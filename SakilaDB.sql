USE sakila;

DESCRIBE actor;

SELECT first_name, last_name FROM actor; 

SELECT CONCAT_WS(" ", `first_name`, `last_name`) AS `Actor Name` FROM actor; 

SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Joe';

SELECT * FROM actor 
WHERE last_name LIKE '%GEN%';

SELECT * FROM actor 
WHERE last_name LIKE '%LI%'
ORDER BY last_name;

SELECT country_id, country FROM COUNTRY 
WHERE  country IN('Afghanistan', 'Bangladesh','China'); 

ALTER TABLE actor
ADD COLUMN middle_name VARCHAR (50)
AFTER first_name;  

ALTER TABLE actor
MODIFY middle_name BLOB; 

ALTER TABLE actor 
DROP COLUMN middle_name; 

SELECT last_name, COUNT(last_name) AS 'Number of Actors'
FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(last_name) AS 'Number of Actors'
FROM actor
GROUP BY last_name 
HAVING COUNT(last_name) > 1; 

UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

SELECT first_name, actor_id FROM actor 
WHERE first_name = 'harpo';

UPDATE actor 
SET first_name = 
	CASE
		WHEN first_name = 'HARPO' THEN 'GROUCHO' 
        ELSE 'MUCHO GROUCHO'
	END  
    
WHERE actor_id = 172; 

SHOW COLUMNS FROM sakila.address; 
SHOW CREATE TABLE sakila.address; 

SELECT staff.first_name, staff.last_name, address.address
FROM staff
Inner JOIN address ON staff.address_id = address.address_id; 

Select staff.staff_id, first_name, last_name, SUM(amount) AS 'Total'
FROM staff 
INNER JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id; 

SELECT title, COUNT(actor_id) AS '# Actors'
FROM film_actor
INNER JOIN film ON film.film_id = film_actor.film_id
GROUP BY title; 

SELECT title, COUNT(inventory_id) AS '# Copies' 
FROM inventory
INNER JOIN film ON film.film_id = inventory.film_id
GROUP BY title
HAVING title = 'Hunchback Impossible'; 

SELECT payment.customer_id, first_name, last_name, sum(amount) AS 'Total Paid'
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY payment.customer_id
ORDER BY last_name;  





