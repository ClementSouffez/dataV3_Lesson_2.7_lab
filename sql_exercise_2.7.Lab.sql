USE sakila;

-- 1- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
-- 2-Display the total amount rung up by each staff member in August of 2005.
-- 3-Which actor has appeared in the most films?
-- 4-Most active customer (the customer that has rented the most number of films)
-- 5-Display the first and last names, as well as the address, of each staff member.
-- 6-List each film and the number of actors who are listed for that film.
-- 7-Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- 8-List number of films per category.

 -- 1-How many films are there for each of 
 -- the categories in the category table. Use appropriate join to write this query.
 
 SELECT category_id,count(film_id)
 FROM category
 JOIN film
 ON category_id
group by category_id

  --2- Display the total amount rung up by each staff member in August of 2005.

SELECT staff_id,SUM(amount) 
FROM payment
GROUP BY staff_id 

  --3- Which actor has appeared in the most films?

-- SELECT actor_id, COUNT(film_id)
-- FROM film_actor
-- GROUP BY actor_id
-- ORDER BY COUNT(film_id) DESC;


SELECT first_name, COUNT(film_id) film_appearances
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY first_name
ORDER BY COUNT(film_id) DESC
LIMIT 2

 -- KENNETH 
 
   --4 - Most active customer (the customer that has rented the most number of films)
   
 SELECT first_name,last_name,COUNT(active) as most_active
 FROM customer
 JOIN rental
 ON customer.customer_id = rental.customer_id
 GROUP BY first_name,last_name
 ORDER BY COUNT(active) DESC
 LIMIT 1
 
   --5- Display the first and last names, as well as the address, of each staff member.
   
 SELECT first_name,last_name,address
 FROM staff
 JOIN address
 ON staff.address_id = address.address_id
 GROUP BY first_name,last_name,address
 
  --6 -List each film and the number of actors who are listed for that film.
 
 SELECT first_name,last_name,film_id,COUNT(film_id) as movie_list
 FROM film_actor
 JOIN actor
 ON film_actor.actor_id = actor.actor_id
 GROUP BY first_name,last_name,film_id;
 
    --7-Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
    --List the customers alphabetically by last name.
 
 SELECT c.last_name,sum(amount) as total_amount
 FROM payment p
 join customer c on p.customer_id = c.customer_id
 GROUP BY c.last_name
 ORDER BY c.last_name ASC;
 
 
    --8 -List number of films per category.
    
  SELECT category_id,count(film_id)
  from film_category
  group by category_id

  
  
  