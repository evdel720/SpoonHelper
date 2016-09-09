# SpoonHelper

[SpoonHelper live][http://www.spoonhelper.us]

SpoonHelper is a full-stack web application inspired by Instructables. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and React.js with a Redux architectural framework on the frontend.

## Features & Implementation

### Single-Page App

  SpoonHelper is a single-page app. All content is rendered on one static page by the React Router.

### Auth
  When user signs in or signs up, the frontend sends an ajax request to the rails backend and creates an action accordingly. It sets the current user or returns an error with proper structure using jbuilder which makes it possible to show inline errors on every form. The app keeps the errors in the store and clears them when the user leaves the form component. For security, the frontend doesn't allow users to see the new recipe form if they are not logged in, nor edit/delete other users' recipes. But also the backend is prepared for invalid requests. It checks the current user's authority with the object first and if it is not right, it renders a prepared error.

### Categories
  This app has 6 categories and each can have an image as a polymorphic association. Each recipe can also have a representative image as a polymorphic association. All recipes belong to categories.
  When a user first visits the app, the frontend requests categories from the database and keeps them in the store to make the category dropdown menu. The database will send back categories with recipe suggestions and those become the front page.
  The categories store doesn't fetch after the first time until user refreshes the page.

### Recipes
  Recipes can have many steps. Steps can be text or images. When a user creates a Recipe, the user can dynamically add, remove, and organize steps without making any request to the database. All requests are taken care of when the user submits the recipe. It also ignores empty text steps. For that, when creating new recipe, the steps attributes has to be passed and handled all at once.
  In the Recipe model, this makes it possible to create and update steps dynamically.
  ``` ruby  
    accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].length == 1 }, allow_destroy: true
  ```
  All the recipes will grab an image after being created, using the last image step as a representative image.

  Recipes can have many comments and likes.

  The recipes controller's index action handles the search result page and each category page. When it receives a category id or search params, it returns recipes accordingly using the below code.

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

  Since the store is constructed as an Object with ids for keys for searching efficiency, recipe sorting is handled at the frontend. To make things cleaner, sorting functions are kept in util/recipe_heper.js

### Like
  User can like recipes to collect them in their liked recipe page. The like table is a join table which links the Recipe table and the User table. Frontend doesn't allow the users who already liked a recipe to click like button.
  Also, with this unique validation, a user can't like one recipe more than once in the backend.
  ```ruby
    :likes, [:user_id, :recipe_id], unique: true # in database migration

validates :recipe_id, uniqueness: { scope: :user_id } # in like model
  ```
### Comment
  Users can leave comments when they are signed in. Users can delete their own comments only.

### Search feature
  When a user types text in the search bar, the frontend sends an ajax request to fetch auto complete. It only shows 5 results at a time. When a user submits the form, it takes the user to the search result page which shows all results.
  All dropdown menus become hidden when the user clicks anything in document.

### Recipe form edit authority and Route
  In the frontend, the edit recipe page's Route is /edit_recipe. The Route doesn't rely on any information about the recipe so other users besides the author can't go to the edit page even if they know recipe's id.

## Future Directions for the Project

In addition to the features already implemented, I plan to continue work on this project. The next steps for SpoonHelper are outlined below.

### Recipe rating
  User can rate the recipes.

### Recipe photos by other users
  Other users can upload pictures that they made with the recipe.

### Shopping cart
  Shopping list model which belongs to users. User can click ingredients to add list items. The list sorts the items by grocery store's categories.
