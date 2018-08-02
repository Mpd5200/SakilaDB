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

SELECT title from film WHERE
language_id IN 
(SELECT language_id FROM language
WHERE name = 'English')
AND (title LIKE '%K%') OR (title LIKE '%Q%'); 


SELECT first_name, last_name FROM actor WHERE
actor_id IN
(SELECT actor_id FROM film_actor
WHERE film_id = 17); 


SELECT customer.first_name, customer.last_name, customer.email, 
country.country
FROM customer
INNER JOIN address ON 
customer.address_id = address.address_id
INNER JOIN city ON 
address.city_id = city.city_id
INNER JOIN country ON
city.country_id = country.country_id 
WHERE country = 'Canada'; 


SELECT title FROM film WHERE
film_id IN
	(SELECT film_id FROM film_category
		WHERE category_id IN
          (SELECT category_id from category
              WHERE name = 'family')); 
              

SELECT title, COUNT(rental.rental_id) AS '# Rentals'
FROM film 
INNER JOIN inventory ON 
film.film_id = inventory.film_id
INNER JOIN rental on 
rental.inventory_id = inventory.inventory_id
GROUP BY title
ORDER BY COUNT('# Rentals') DESC; 


SELECT store.store_id, SUM(payment.amount) AS 'Revenue'
FROM store
INNER JOIN staff ON
store.store_id = staff.store_id
INNER JOIN payment ON 
payment.staff_id = staff.staff_id
GROUP BY store_id; 


SELECT store.store_id, city.city, country.country
FROM store
INNER JOIN address ON
store.address_id = address.address_id
INNER JOIN city ON 
address.city_id = city.city_id
JOIN country ON 
city.country_id = country.country_id; 



SELECT categoty.name, SUM(payment.amount) AS 'Revenue'
FROM categoty 
INNER JOIN staff ON
store.store_id = staff.store_id
INNER JOIN payment ON 
payment.staff_id = staff.staff_id
GROUP BY store_id; 


