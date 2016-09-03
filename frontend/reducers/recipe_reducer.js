import { RecipeConstants } from '../actions/recipe_actions.js';
import merge from 'lodash/merge';

const defaultState = {
  index: {},
  detail: {
    id: undefined,
    title: undefined,
    ingredients: undefined,
    description: undefined,
    category: undefined,
    steps: [],
    user: undefined
  }
};

const RecipeReducer = (state=defaultState, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case RecipeConstants.RECEIVE_RECIPES:
      newState.index = action.recipes;
      return newState;
    case RecipeConstants.RECEIVE_SINGLE_RECIPE:
      newState.detail = action.recipe;
      return newState;
    case RecipeConstants.CLEAR_SINGLE_RECIPE:
      newState.detail = defaultState.detail;
      return newState;
    case RecipeConstants.CLEAR_RECIPE_INDEX:
      newState.index = {};
      return newState;
    default:
      return state;
  }
};

export default RecipeReducer;
