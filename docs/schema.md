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
has_one image

## recipes
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
title        | string    | not null
description  | string    | not null
ingredients  | string    | not null
user_id      | integer   | not null, foreign key (references users), indexed
category_id  | integer   | not null, foreign key (references categories), indexed
has_many steps, images, comments, videos


## steps
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
body        | text      | not null
order       | integer   | not null
recipe_id   | integer   | not null, foreign key (references recipes)

## imageable
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
url         | string    | not null
order       | integer   | not null
imageable_id| integer   | not null, foreign key (references polymorphic association)

## videos
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
url         | string    | not null
order       | integer   | not null
recipe_id   | integer   | not null, foreign key (references recipes)

## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
content     | string    | not null
user_id     | integer   | not null, foreign key (references users), indexed
recipe_id   | integer   | not null, foreign key (references recipes), indexed
has_one image

## collections
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
