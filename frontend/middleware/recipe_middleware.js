import { RecipeConstants, requestSingleRecipe, receiveRecipes, receiveSingleRecipe, clearSingleRecipe } from '../actions/recipe_actions.js';
import { receiveErrors, clearErrors } from '../actions/error_actions.js';
import * as RecipeUtil from '../util/recipe_api_util.js';
import { hashHistory } from 'react-router';

const RecipeMiddleware = (store) => (next) => (action) => {
  const fetchCategorySuccess = (recipes) => {
    store.dispatch(receiveRecipes(recipes));
  };

  const fetchSingleSuccess = (recipe) => {
    store.dispatch(receiveSingleRecipe(recipe));
  };

  const destroySuccess = () => {
    store.dispatch(clearSingleRecipe());
  };

  const errorCallback = (errors) => {
    store.dispatch(receiveErrors(errors.responseJSON));
  };

  const createUpdateSuccess = (recipe) => {
    store.dispatch(receiveSingleRecipe(recipe));
    hashHistory.push(`/recipes/${recipe.id}`);
  };

  switch (action.type) {
    case RecipeConstants.DESTROY_RECIPE:
      RecipeUtil.deleteRecipe(action.rId, destroySuccess);
      break;
    case RecipeConstants.REQUEST_CATEGORY_RECIPES:
      RecipeUtil.fetchCategoryRecipes(action.cId, fetchCategorySuccess);
      break;
    case RecipeConstants.REQUEST_SINGLIE_RECIPE:
      RecipeUtil.fetchSingleRecipe(action.rId, fetchSingleSuccess);
      break;
    case RecipeConstants.CREATE_RECIPE:
      RecipeUtil.createRecipe(action.recipe, createUpdateSuccess, errorCallback);
      break;
    case RecipeConstants.UPDATE_RECIPE:
      RecipeUtil.updateRecipe(
        action.rId,
        action.recipe,
        createUpdateSuccess,
        errorCallback
      );
      break;
    default:
      return next(action);
  }
};

export default RecipeMiddleware;
