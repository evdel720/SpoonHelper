# Redux Structure
## Auth Cycles

### Session API Request Actions

* `signUp`
  0. invoked from `SignupForm` `onSubmit`
  0. `POST /api/users` is called.
  0. `receiveCurrentUser` is set as the success callback.
* `signIn`
  0. invoked from `Navbar` `onSubmit`
  0. `POST /api/session` is called.
  0. `receiveCurrentUser` is set as the callback.
* `signOut`
  0. invoked from `Navbar` `onClick`
  0. `DELETE /api/session` is called.
  0. `removeCurrentUser` is set as the success callback.
* `fetchCurrentUser`
  0. invoked from `App` in `onEnter`
  0. `GET /api/session` is called.
  0. `receiveCurrentUser` is set as the success callback.

### Session API Response Actions

* `receiveCurrentUser`
  0. invoked from an API callback
  0. the `SessionReducer` stores `currentUser` in the application's state.
* `removeCurrentUser`
  0. invoked from an API callback
  0. the `SessionReducer` removes `currentUser` from the application's state.


### User API Request Actions

* `addCollection`
  0. invoked from star button in `RecipesIndex` or `RecipeDetail`
  0. `PATCH /api/users/:id` is called.
  0. `updateCurrentUser` is set as the success callback.
* `addLikes`
  0. invoked from thumbs up button in `RecipesIndex` or `RecipeDetail`
  0. `PATCH /api/users/:id` is called.
  0. `updateCurrentUser` is set as the callback.

### User API Response Actions

* `updateCurrentUser`
  0. invoked from an API callback
  0. the `SessionReducer` updates `currentUser` in the application's state.

## Error Cycles

### Error API Response Actions
* `setErrors`
  0. invoked from API callbacks on error for actions that generate requests
  0. the `ErrorReducer` stores the `form` in the application's state; `errors` are mapped to their respective forms
* `removeErrors`
  0. invoked from API callbacks on success for actions that generate requests
  0. the `ErrorReducer` removes `errors` for a given `form` in the application's state.

## Category Cycles

### Category API Request Action

* `fetchAllCategory`
  0. invoked from `Home` `onEnter`
  0. `GET /api/categories` is called.
  0. `receiveAllCategory` is set as the success callback.

### Category API Response Action

* `receiveAllCategory`
  0. invoked from an API callback
  0. the `CategoryReducer` updates `categories` in the application's state.

## Recipe Cycles

### Recipe API Request Actions

* `fetchAllRecipe`
  0. invoked from `RecipeIndexContainer` `onEnter`
  0. `GET /api/recipes` is called.
  0. `receiveAllRecipe` is set as the success callback.

* `createRecipe`
  0. invoked from `RecipeFormContainer` form `onSubmit`
  0. `POST /api/recipes` is called.
  0. `receiveSingleRecipe` is set as the success callback.

* `fetchSingleRecipe`
  0. invoked from `RecipeDetailContainer` `onEnter`
  0. `GET /api/recipes/:id` is called.
  0. `receiveSingleRecipe` is set as the success callback.

* `updateRecipe`
  0. invoked from `RecipeFormContainer` `onSubmit`
  0. `PATCH /api/recipes/:id` is called.
  0. `receiveSingleRecipe` is set as the success callback.

* `destroyRecipe`
  0. invoked from `RecipeDetailContainer` delete recipe button `onClick`
  0. `DELETE /api/recipes/:id` is called.
  0. `removeRecipe` is set as the success callback.

### Recipe API Response Actions

* `receiveAllRecipe`
  0. invoked from an API callback
  0. the `RecipeReducer` updates `recipes` in the application's state.

* `receiveSingleRecipe`
  0. invoked from an API callback
  0. the `RecipeReducer` updates `recipe` in the application's state.

* `removeRecipe`
  0. invoked from an API callback
  0. the `RecipeReducer` removes `recipe` from the application's state.

## Search Cycles

* `fetchSearch`
  0. invoked from `HomeContainer` search bar `onChange` when there is text
  0. `GET /api/recipes?title=searching_text` is called with `title` param.
  0. `receiveAllRecipe` is set as the success callback.
