export const RecipeConstants = {
  REQUEST_RECIPES: "REQUEST_RECIPES",
  RECEIVE_RECIPES: "RECEIVE_RECIPES",
  REQUEST_SINGLIE_RECIPE: "REQUEST_SINGLIE_RECIPE",
  RECEIVE_SINGLE_RECIPE: "RECEIVE_SINGLE_RECIPE",
  CREATE_RECIPE: "CREATE_RECIPE",
  UPDATE_RECIPE: "UPDATE_RECIPE",
  DESTROY_RECIPE: "DESTROY_RECIPE",
  CLEAR_SINGLE_RECIPE: "CLEAR_SINGLE_RECIPE"
};

export const clearSingleRecipe = () => ({
  type: RecipeConstants.CLEAR_SINGLE_RECIPE
});

export const requestCategoryRecipes = (categoryId) => ({
  type: RecipeConstants.REQUEST_RECIPES,
  categoryId
});

export const receiveRecipes = (recipes) => ({
  type: RecipeConstants.RECEIVE_RECIPES,
  recipes
});

export const requestSingleRecipe = (rId) => ({
  type: RecipeConstants.RECEIVE_SINGLE_RECIPE,
  rId
});

export const receiveSingleRecipe = (recipe) => ({
  type: RecipeConstants.RECEIVE_SINGLE_RECIPE,
  recipe
});

export const createRecipe = (recipe) => ({
  type: RecipeConstants.CREATE_RECIPE,
  recipe
});

export const updateRecipe = (rId, recipe) => ({
  type: RecipeConstants.UPDATE_RECIPE,
  rId,
  recipe
});

export const destroyRecipe = (recipeId) => ({
  type: RecipeConstants.DESTROY_RECIPE,
  recipeId
});
