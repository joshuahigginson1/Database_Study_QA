# Sakila Database Assessment - QA
#### Joshua Higginson - 16th July 2020

Import Sakila Schema, then Sakila Data.

##### Tables in Sakila:
* actor, actor_info, address, category, city, country, customer, customer_list, film,
film_actor, film_category, film_list, film_text, inventory, language, nicer_but_slower_film_list, payment, rental, sales_by_film_category, sales_by_store,
staff, staff_list, store.

***

##### Describe actor:
* actor_id (PKey), first_name, last_name (FKey), last_update.

##### Describe actor_info (View):
* actor_id, first_name, last_name, film_info.

##### Fields in address:
* address_id (PKey), address, address2, district, city_id (FKey), postal_code, phone, location (FKey), last_update.

##### Describe category (View):
* category_id, name, last_update.

##### Describe city:
* city_id (PKey), city, country_id (FKey), last_update.

##### Describe country:
* country_id (PKey), country, last_update.

##### Describe customer:
* customer_id, (PKey), store_id (FKey), first_name, last_name(FKey), email, address_id (FKey), active, create_date, last_update.

##### Describe customer_list (View):
* ID, name, address, zip_code, phone, city, country, notes, SID.

##### Describe film:
* film_id (PKey), title (FKey), description, release_year, language_id (FKey), original_language_id (FKey), rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update.

##### Describe film_actor:
* actor_id (PKey), film_id (PKey), last_update.

##### Describe film_category:
* film_id (PKey), category_id(PKey), last_update.

##### Describe film_list (View):
* FID, title, description, category, price, length, rating, actors.

##### Describe film_text:
* film_id (PKey), title (FKey), description.

##### Describe inventory:
* inventory_id(PKey), film_id (FKey), store_id (FKey), last_update.

##### Describe language:
* language_id (PKey), name, last_update.

##### Describe nicer_but_slower_film_list (View):
* FID, title, description, category, price, length, rating, actors.

##### Describe payment:
* payment_id (PKey), customer_id (FKey), staff_id(FKey), rental_id(FKey), amount, payment_date, last_update.

##### Describe rental:
* rental_id (PKey), rental_date, inventory_id(FKey), customer_id(FKey), return_date, staff_id (FKey), last_update.

##### Describe sales_by_film_category (View):
* category, total_sales.

##### Describe sales_by_store (View):
* store, manager, total_sales.

##### Describe staff:
* staff_id (PKey), first_name, last_name, address_id(FKey), picture, email, store_id (FKey), active, username, password, last_update.


##### Describe staff_list (View):
* ID, name, address, zip code, phone, city, country, SID.


##### Describe store:
* store_id (PKey), manager_staff_id, address_id (FKey), last_update.

***

*Question 1*:

SELECT all actors from table.

```
SELECT actor_id, first_name, last_name  
FROM actor;
```

*Question 2*:

Find the actor with the first name 'John'.

```
SELECT actor_id, first_name, last_name  
FROM actor  
WHERE first_name='John';
```

*Question 3*:

Find all actors with the surname “Neeson”.

```
SELECT actor_id, first_name, last_name  
FROM actor  
WHERE last_name='Neeson';
```

*Question 4*:

Find all actors with Id numbers divisible by 10.

```
SELECT actor_id, first_name, last_name  
FROM actor  
WHERE actor_id % 10 = 0;
```

*Question 5*:

What is the description of the movie with ID of 100?

```
SELECT film_id, title, description  
FROM film  
WHERE film_id = 100;
```

*Question 6*:

Find every movie with a rating of “R”.

```
SELECT film_id, title, rating  
FROM film  
WHERE rating = 'R';
```

*Question 7*:

Find every movie except those with a rating of “R”.

```
SELECT film_id, title, rating  
FROM film  
WHERE rating != 'R';
```

*Question 8*:

Find the 10 shortest movies.

> Sort by length in ascending order.  
LIMIT 10 to choose the first 10.

```
SELECT film_id, title, length  
FROM film  
ORDER BY length ASC  
LIMIT 10;
```

*Question 9*:

Now return only the movie titles.

```
SELECT title  
FROM film  
ORDER BY length ASC  
LIMIT 10;

```

*Question 10*:

Find all movies with Deleted Scenes.

> A deleted scene would be a special feature. Films could contain multiple special features, so we need to use wildcards within our LIKE when searching for a pattern.

```
SELECT film_id, title, special_features
FROM film
WHERE special_features LIKE "%Deleted Scenes%";
```

*Question 11*:

Which last names are not repeated?

> Here, we use the DISTINCT keyword.

```
SELECT DISTINCT last_name
FROM actor;
```

*Question 12*

Which last names appear more than once?

> Not massively sure on how this works, so needs some further study.

```
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

```

*Question 13*: **WOULD ACTOR ID SUFFICE? COME BACK LATER**

Which actor has appeared in the most films?

> For this, I would count the appearance of every actor_ID in films.  
Then, I would sort by highest to lowest, then limit 1.

```
SELECT actor_id, COUNT(film_id)
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;
```

*Question 14*:


Is ‘Academy Dinosaur’ available for rent from Store 1?

> First, we need to look at the rental inventory of store_id = 1.  
Then we need to find the film id of academy dinosaur and compare the two.

```
SELECT *
FROM inventory
WHERE store_id = 1 AND film_id = (
  SELECT film_id
  FROM film
  WHERE title = 'Academy Dinosaur'
);

```

*Question 15*: **MOVING ON DOESNT WORK**

When is ‘Academy Dinosaur’ due?

> Look at rental date, and return date.

SELECT rental_id, rental_date, inventory_id, customer_id, return_date
FROM rental
WHERE inventory_id = (
  SELECT inventory_id
  FROM inventory
  WHERE film_id = (
    SELECT film_id
    FROM film
    WHERE title = 'Academy Dinosaur'
  )  
);

*Question 16*:

What is that average running time of all the films in the database?

```
SELECT AVG(length)
FROM film;
```

*Question 17*:

What is the average running time of films by category?

```
SELECT category, AVG(length)
FROM film_list
GROUP BY category;
```

*Question 18*:

How many movies have Robots in them?

> First off, we need to work out HOW to find movies with robots in them!
This search relies on the assumption that a movie will have a robot within it, if there is the key word 'robot' in the title or description.

```
SELECT title
FROM film_text
WHERE description LIKE "%robot%"
OR title LIKE "%robot%";
```

*Question 19*:

Find the movie(s) with the longest runtime.

```
SELECT title, length
FROM film
WHERE length = (
  SELECT MAX(length)
  FROM film
);
```

*Question 20*:

Count how many movies were released in 2010.

```
SELECT COUNT(release_year)
FROM film
WHERE release_year = 2010;
```

*Question 21*:

Find the titles of all horror movies.

```
SELECT title, category
FROM film_list
WHERE category = 'Horror';
```


*Question 22*:

Return the full name of the staff member – in a column named full_name – with the ID of 1.

```
SELECT name
FROM staff_list
WHERE id = 1;
```

*Question 23*:

Retrieve all movies that Fred Costner has appeared in.

```
SELECT title
FROM film_list
WHERE actors LIKE '%Fred Costner%';
```

*Question 24*: **SKIP RUNING OUT OF TIME**

Find out which location has the most copies of BUCKET BROTHERHOOD.
> find the film_id of bucket brohood, count number of times in the  inventory filed, sort by store_id, order by most copies of particular film bucket brotherhood, limit 1 or use MAX(). SELECT film_id
FROM film
WHERE title = 'BUCKET BROTHERHOOD';


```
SELECT store_id, COUNT(film_id) AS countfilm
FROM inventory
WHERE film_id = 103  
GROUP BY store_id
ORDER BY countfilm ASC
LIMIT 1;
```
*Question 25*:

How many distinct countries are there?

```
SELECT DISTINCT COUNT(country)
FROM country;

```

What are the names of all the languages in the database (sorted alphabetically)?


```
SELECT DISTINCT country
FROM country
ORDER BY country ASC;

```


*Question 26*:

Return the full names (first and last) of actors with “son” in their last name, ordered by their first name. 

> ANSWER.

*Question 27*:

> ANSWER.

*Question 28*:

> ANSWER.

*Question 29*:

> ANSWER.
