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
* FID, title, description,category, price, length, rating, actors.

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
* staff_id (PKey), first_name, last_name, address_id(FKey), picture, email, store_id (FKey), active, uesrname, password, last_update.


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
SELECT title, length  
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

```


```


*Question 11*:

> ANSWER.

*Question 12*:

> ANSWER.

*Question 13*:

> ANSWER.

*Question 14*:

> ANSWER.

*Question 15*:

> ANSWER.


*Question 16*:

> ANSWER.

*Question 17*:

> ANSWER.

*Question 18*:

> ANSWER.

*Question 19*:

> ANSWER.

*Question 20*:

> ANSWER.

*Question 21*:

> ANSWER.

*Question 22*:

> ANSWER.

*Question 23*:

> ANSWER.

*Question 24*:

> ANSWER.

*Question 25*:

> ANSWER.

*Question 26*:

> ANSWER.

*Question 27*:

> ANSWER.

*Question 28*:

> ANSWER.

*Question 29*:

> ANSWER.
