export const RecipeConstants = {
  REQUEST_CATEGORY_RECIPES: "REQUEST_CATEGORY_RECIPES",
  RECEIVE_RECIPES: "RECEIVE_RECIPES",
  REQUEST_SINGLIE_RECIPE: "REQUEST_SINGLIE_RECIPE",
  RECEIVE_SINGLE_RECIPE: "RECEIVE_SINGLE_RECIPE",
  CREATE_RECIPE: "CREATE_RECIPE",
  UPDATE_RECIPE: "UPDATE_RECIPE",
  DESTROY_RECIPE: "DESTROY_RECIPE",
  CLEAR_SINGLE_RECIPE: "CLEAR_SINGLE_RECIPE",
  CLEAR_RECIPE_INDEX: "CLEAR_RECIPE_INDEX",
  ADD_COMMENT: "ADD_COMMENT",
  DELETE_COMMENT: "DELETE_COMMENT"
};

export const addComment = (comment) => ({
  type: RecipeConstants.ADD_COMMENT,
  comment
});

export const deleteComment = (comment) => ({
  type: RecipeConstants.DELETE_COMMENT,
  comment
});

export const clearRecipeIndex = () => ({
  type: RecipeConstants.CLEAR_RECIPE_INDEX
});

export const clearSingleRecipe = () => ({
  type: RecipeConstants.CLEAR_SINGLE_RECIPE
});

export const requestCategoryRecipes = (cId) => ({
  type: RecipeConstants.REQUEST_CATEGORY_RECIPES,
  cId
});

export const receiveRecipes = (recipes) => ({
  type: RecipeConstants.RECEIVE_RECIPES,
  recipes
});

export const requestSingleRecipe = (rId) => ({
  type: RecipeConstants.REQUEST_SINGLIE_RECIPE,
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

export const destroyRecipe = (rId) => ({
  type: RecipeConstants.DESTROY_RECIPE,
  rId
});
