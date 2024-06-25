-- Step 1
create table restaurant (
  id integer PRIMARY KEY,
  name varchar(20),
  description varchar(100),
  rating decimal,
  telephone char(10),
  hours varchar(100));

create table address (
  id integer PRIMARY KEY,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state varchar(15),
  google_map_link varchar(50),
  restaurant_id integer REFERENCES restaurant(id));

-- Step 2
SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'resturant';

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'address';

-- Step 3
create table category (
  id char(2) PRIMARY KEY,
  name varchar(20),
  description varchar(200));

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'category';

-- Step 4
create table dish (
  id integer PRIMARY KEY,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean);

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'dish';

-- Step 5
create table review (
  id integer PRIMARY KEY,
  rating decimal,
  description varchar(100),
  "date" date,
  restaurant_id integer REFERENCES restaurant(id));

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'review';

-- Step 8
create table categories_dishes (
  category_id varchar(2),
  dish_name varchar(50),
  price money,
  primary key(category_id, dish_name)
);

/* Inserting values into tables */

/* Restaurant */

-- Restaurant table
insert into restaurant values (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* Address */

-- Address table
insert into address values (
  1,
  '2020',
  'Busy Street',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* Review */

-- Review table
insert into review values (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  '1'
);

insert into review values (
  2,
  4.5,
  'Other than a small mix up, I would give it a 5.0!',
  '04-01-2020',
  '1'
);

insert into review values (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  '1'
);

/* Category */

-- Category table
insert into category values (
  'C',
  'Chicken',
  null
);

insert into category values (
  'LS',
  'Luncheon Specials',
  'Served with Hot and SOur Soup or Egg Drop Soup and Fried or Steam Rice between 11:00 am and 3:00 pm from Monday to Friday.'
);

insert into category values (
  'HS',
  'House Specials',
  null
);

/* Dish */

-- Dish table
insert into dish values (
  1,
  'Chicken with Brocolli',
  'Diced chicken stir-fried with succulent brocolli florets'
  false
);

insert into dish values (
  2,
  'Sweet and Sour Chicken',
  'Marinated chickenwit tangy sweet and sour sauce together wit pineapples and green peppers',
  false
);

insert into dish values (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entrree to spice up any lumch or dinner',
  true
);

insert into dish values (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

insert into dish values (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

insert into dish values (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken falvored with savory sesame sauce',
  false
);

insert into dish values (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce',
  false
);

insert into dish values (
  8,
  'Human Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/* categories dishes     */

insert into categories_dish values(
  'C',
  1,
  6.95
);

insert into categories_dish values(
  'C',
  3,
  6.95
);

insert into categories_dish values(
  'LS',
  1,
  8.95
);

insert into categories_dish values(
  'LS',
  4,
  8.95
);

insert into categories_dish values(
  'LS',
  5,
  8.95
);

insert into categories_dish values(
  'HS',
  6,
  8.95
);

insert into categories_dish values(
  'HS',
  7,
  8.95
);

insert into categories_dish values(
  'HS',
  8,
  8.95
);

/*************
  QUERIES
**************/
SELECT name AS res_name, street_number, street_name, city, state 
FROM restaurant INNER JOIN address
ON restaurant.id = address.restaurant_id; 

SELECT MAX(rating) AS best_rating FROM restaurant;

SELECT category.name AS category, dish_name, price 
FROM category INNER JOIN categories_dishes 
ON category.id = categories_dishes.category_id;

select name AS spicy_dish_name, category_id, price 
from dish INNER JOIN categories_dishes 
ON dish.name = categories_dishes.dish_name
WHERE hot_and_spicy = 't';

SELECT name AS dish_name, id AS dish_id, COUNT(id) AS dish_count
FROM dish
GROUP BY dish_id
HAVING (id) > 1;

SELECT rating AS best_rating, description
FROM restaurant
WHERE rating = ( SELECT MAX(rating) from restaurant );