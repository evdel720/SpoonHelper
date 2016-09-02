import { RecipeConstants } from '../actions/recipe_actions.js';
import merge from 'lodash/merge';

const defaultState = {
  index: {},
  detail: {
    id: undefined,
    title: undefined,
    ingredients: undefined,
    description: undefined,
    category_id: undefined,
    steps: [],
    user: undefined
  }
};

const RecipeReducer = (state=defaultState, action) => {
  switch (action.type) {
    case RecipeConstants.RECEIVE_RECIPES:
      return merge({}, state, {index: action.recipes});
    case RecipeConstants.RECEIVE_SINGLE_RECIPE:
      return merge({}, state, {detail: action.recipe});
    default:
      return state;
  }
};

export default RecipeReducer;
