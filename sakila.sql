USE sakila;
SELECT * FROM film_category;
-- 1. List all actors.
SELECT first_name, last_name FROM actor;
-- 2. Find the surname of the actor with the forename 'John'.
SELECT last_name FROM actor WHERE first_name='John';
-- 3. Find all actors with surname 'Neeson'.
SELECT first_name, last_name FROM actor WHERE last_name='Neeson';
-- 4. Find all actors with ID numbers divisible by 10.
SELECT first_name, last_name FROM actor WHERE (actor_id % 10)=0;
-- 5. What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id=100;
-- 6. Find every R-rated movie.
SELECT title FROM film WHERE rating='R';
-- 7. Find every non-R-rated movie
SELECT title FROM film WHERE rating NOT IN ('R');
-- 8. Find the ten shortest movies.
SELECT title FROM film ORDER BY length ASC LIMIT 10;
-- 9. Find the movies with the longest runtime, without using LIMIT.
SELECT MAX(length) FROM film;
SELECT title FROM film WHERE length=185;
-- 10. Find all movies that have deleted scenes
SELECT title FROM film WHERE special_features LIKE '%Deleted Scenes%';
-- 11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT DISTINCT last_name FROM actor HAVING last_name IS NOT NULL ORDER BY last_name DESC;
-- 12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*)>1 ORDER BY COUNT(*) DESC;
-- 13. Which actor has appeared in the most films?
SELECT first_name, last_name FROM actor WHERE actor_id=(SELECT actor_id FROM film_actor GROUP BY actor_id ORDER BY COUNT(actor_id) DESC LIMIT 1);
-- 14. When is 'Academy Dinosaur' due?
SELECT return_date FROM rental WHERE inventory_id=(SELECT inventory_id FROM inventory WHERE film_id=(SELECT film_id FROM film WHERE title='Academy Dinosaur') ORDER BY rental_date DESC LIMIT 1) ORDER BY rental_date DESC LIMIT 1;
-- 15. What is the average runtime of all films?
SELECT AVG(length) FROM film;
-- 16. List the average runtime for every film category.
SELECT fc.category_id, AVG(length) FROM film f JOIN film_category fc ON f.film_id = fc.film_id GROUP BY fc.category_id;
-- 17. List all movies featuring a robot
SELECT title FROM film_text WHERE description LIKE '%robot%';
-- 18. How many movies were released in 2010?
SELECT COUNT(*) release_year FROM film WHERE release_year=2010;
-- 19. Find the titles of all the horror movies
SELECT f.title, c.name FROM film f JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id WHERE c.name = 'Horror';
-- 20. List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff WHERE staff_id= 2;
-- 21. List all the movies that Fred Costner has appeared in.
SELECT title FROM film f JOIN film_actor fa ON f.film_id = fa.film_id JOIN actor a ON fa.actor_id = a.actor_id WHERE a.first_name='Fred' AND a.last_name='Costner';
-- 22. How many distinct countries are there?
SELECT DISTINCT country FROM country;
-- 23. List the name of every language in reverse-alphabetical order.
SELECT name FROM language ORDER BY name DESC;
-- 24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son' ORDER BY first_name ASC;
-- 25. Which category contains the most films?
SELECT c.name, c.category_id, COUNT(*) film_count FROM category c JOIN film_category fc ON fc.category_id = c.category_id JOIN film f ON fc.film_id = f.film_id GROUP BY c.name ORDER BY film_count DESC LIMIT 1;
