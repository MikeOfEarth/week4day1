-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name), first_name, last_name 
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY first_name, last_name;
--(2 Wahlbergers's)


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount), amount 
FROM payment
WHERE amount BETWEEN 3.99 and 5.99
GROUP BY amount;
--(0 reasonable payments)


-- 3. What film does the store have the most of? (search in inventory)
SELECT Count(film_id), film_id
from inventory
GROUP by film_id
ORDER by count(film_id) DESC;
--multiple films with 8 count but we will go with id=193
SELECT title, film_id
from film
where film_id = 193;
--(Crossroads Casualties ranks among the top... yikes)


-- 4. How many customers have the last name ‘William’?
SELECT COUNT(last_name), first_name, last_name 
FROM customer
WHERE last_name LIKE 'William'
GROUP BY first_name, last_name;
--(0 with the last name William... but)
SELECT COUNT(last_name), first_name, last_name 
FROM customer
WHERE last_name LIKE 'William%'
GROUP BY first_name, last_name;
--(2 with last names that start with William*)


-- 5. What store employee (get the id) sold the most rentals?
SELECT *
FROM sales;
--(you'd think it would be sales, but I guess not so we will try payements)
SELECT COUNT(staff_id), staff_id 
FROM payment
GROUP BY staff_id;
--(in  a tight race staff_id 2 took the lead at 7304 sales)
Select first_name, last_name, staff_id
from staff
where staff_id = 2;
--(and his name was JOHN CENA, wait no, John Stephens, my bad)


-- 6. How many different district names are there?
SELECT count(district)
FROM address
--(not exaxtly the Hunger Games but there are 603 districts. That's a big battle royale)


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select count(actor_id), film_id
from film_actor
group BY film_id
order by count(actor_id) DESC
--(looks like there are 15 actors in film 508)
SELECT title, film_id
from film
where film_id = 508;
--(Film 508, the classic, Lambs Cincinatti)


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select *
from customers
select *
from payment
select *
from sales
--(not tracking where this info is so I will try to imagine a data set)
select count(last_name), last_name, store_id
from payment
where last_name LIKE "%es" and store_id = 1
GROUP BY store_id
--(looks like just LeBron but can't tell where he shops)


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount), amount 
FROM payment
WHERE  customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING count(amount) > 250;
--(looking like 3)


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
select count(rating), rating
from film
GROUP By rating
order by count(rating) DESC
--(PG-13 has the highest count with 224)

--(and if I couldn't count)
select count(Distinct rating)
from film
--(theres 5 categories to choose from)

