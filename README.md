# SpoonHelper

[SpoonHelper live][http://www.spoonhelper.us]

SpoonHelper is a full-stack web application inspired by Instructables. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and React.js with a Redux architectural framework on the front-end.

## Features & Implementation

### Single-Page App

  SpoonHelper is a single-page app. All content is rendered on one static page by React Route.

### User and Session
  When user signs in or signs up, the front-end sends ajax request to rails backend and creates action accordingly. It sets current user or returns error in proper structure with jbuilder which makes inline error showing in every form possible. The app keeps the errors in store and clears them when the user leaves the form component.

### Categories
  This app has 6 categories and each can have an image as polymorphic association. Each recipe can also have an representative image as polymorphic association. All recipes are belonged to categories.
  When a user first visit the app, the front-end requests categories to the database and keep them in store to make category dropdown menu. The database will send back categories with recipe suggestions and those become the front page.
  Categories store doesn't fetch after first time until user refresh the page.

### Recipes
  Recipes can have many steps. Steps can be text or image. When user creates Recipe, user can dynamically add, remove, and organize steps without making any request to the database. All request would be taken care of when the user submits the recipe. It also ignores empty text steps. For that, when creating new recipe, the steps attributes has to be passed and treated at once.
  In the Recipe model, this makes it possible to create and update steps dynamically.
  ``` ruby  
    accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].length == 1 }, allow_destroy: true
  ```
  All the recipes will grab an image after it is created, the last image step as a representative image.

  Recipe can have many comments and likes.

  Recipes controller's index action treats search result page and each category page. When it receives category id or search params, it returns recipes accordingly like below.

  ```ruby
    if params[:search_option]
      @recipes = Recipe.where("#{params[:search_option]} ILIKE ?", "%#{params[:search_value]}%")
      @category = 'Search Result'
    elsif params[:category_id] != '0'
      @recipes = Recipe.where(category_id: params[:category_id])
      @category = Category.find_by(id: params[:category_id]).title
    else
      @recipes = Recipe.all
      @category = 'All'
    end
  ```

  Since the store is constructed as Objects with ids as their keys for searching efficiency, recipe sorting is treated at the front-end. To make things cleaner, sorting functions are kept in util/recipe_heper.js

### Like
  User can like recipes to collect them in their liked recipe page. Like table is a join table which links Recipe table and User table. With this unique validation, user can't like one recipe more than once.
  ```ruby
    :likes, [:user_id, :recipe_id], unique: true # in database migration

    validates :recipe_id, uniqueness: { scope: :user_id } # in like model
  ```
### Comment
  User can leave comments when they are signed in. User can delete their own comments only.

### Search feature
  When user type text in the search bar, the front-end sends ajax request to fetch auto complete. It only shows 5 things from top. When user submit the form, it takes user to the search result page which shows all results.
  All dropdown menus become hidden when user clicks anything in document.

### Recipe form edit authority and Route
  In front-end, edit recipe page's Route is edit_recipe. The Route doesn't rely on any information about recipe so other users except the author can't go to the edit page even if they know recipe's id.

## Future Directions for the Project

In addition to the features already implemented, I plan to continue work on this project. The next steps for SpoonHelper are outlined below.

### Recipe rating by user
  User can rate the recipes.

### Recipe photos by other users
  Other users can upload pictures that they made with the recipe.

### Shopping cart
  Shopping list model which belongs to users. User can click ingredients to add list items. The list sorts the items by grocery store's categories.
