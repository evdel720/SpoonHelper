import { RecipeConstants } from '../actions/recipe_actions.js';
import merge from 'lodash/merge';
import { SessionConstants } from '../actions/session_actions.js';

const defaultState = {
  index: {},
  detail: {
    id: undefined,
    title: undefined,
    ingredients: undefined,
    description: undefined,
    category: undefined,
    steps: [],
    comments: [],
    user: undefined
  }
};

const RecipeReducer = (state=defaultState, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case SessionConstants.ADD_LIKE:
      newState.detail.likes += 1;
      return newState;
    case SessionConstants.REMOVE_LIKE:
      newState.detail.likes -= 1;
      return newState;
    case RecipeConstants.ADD_COMMENT:
      newState.detail.comments = newState.detail.comments.concat(action.comment.comment);
      return newState;
    case RecipeConstants.DELETE_COMMENT:
      let comments = newState.detail.comments;
      let index = comments.map((c) => c.id).indexOf(parseInt(action.comment.id));
      comments.splice(index, 1);
      newState.detail.comments = comments;
      return newState;
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
