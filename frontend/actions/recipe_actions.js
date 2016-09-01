export const RecipeConstants = {
  REQUEST_RECIPES: "REQUEST_RECIPES",
  RECEIVE_RECIPES: "RECEIVE_RECIPES",
  REQUEST_SINGLIE_RECIPE: "REQUEST_SINGLIE_RECIPE",
  RECEIVE_SINGLE_RECIPE: "RECEIVE_SINGLE_RECIPE",
  CREATE_RECIPE: "CREATE_RECIPE",
  UPDATE_RECIPE: "UPDATE_RECIPE",
  DESTROY_RECIPE: "DESTROY_RECIPE"
};

export const requestRecipes = () => ({
  type: RecipeConstants.REQUEST_RECIPES
});

export const receiveRecipes = (recipes) => ({
  type: RecipeConstants.RECEIVE_RECIPES,
  recipes
});

export const requestSingleRecipe = () => ({
  type: RecipeConstants.RECEIVE_SINGLE_RECIPE
});

export const receiveSingleRecipe = (recipe) => ({
  type: RecipeConstants.RECEIVE_SINGLE_RECIPE,
  recipe
});

export const createRecipe = (recipe) => ({
  type: RecipeConstants.CREATE_RECIPE,
  recipe
});

export const updateRecipe = (recipe) => ({
  type: RecipeConstants.UPDATE_RECIPE,
  recipe
});

export const destroyRecipe = (recipeId) => ({
  type: RecipeConstants.DESTROY_RECIPE,
  recipeId
});
