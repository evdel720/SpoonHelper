# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, indexed, unique
password_digest | string    | not null
session_token   | string    | not null, indexed, unique
bio             | text      | not null


## categories
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
image       | string    | not null

## recipes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
description | string    | not null
ingredients | string    | not null
rep_image   | string    | not null
user_id     | integer   | not null, foreign key (references users), indexed
category_id | integer   | not null, foreign key (references categories), indexed

## steps
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
instruction | text      | not null
asset       | string    | not null
recipe_id   | integer   | not null, foreign key (references recipes), indexed

## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
content     | string    |
user_id     | integer   | not null, foreign key (references users), indexed
recipe_id   | integer   | not null, foreign key (references recipes), indexed

## user_collections
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users)
recipe_id   | integer   | not null, foreign key (references recipes)
unique, indexed [user_id, recipe_id]

## likes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users), indexed, unique with recipe_id
recipe_id   | integer   | not null, foreign key (references recipes), indexed
unique, indexed [user_id, recipe_id]
