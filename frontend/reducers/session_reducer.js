import { SessionConstants } from '../actions/session_actions.js';
import merge from 'lodash/merge';

const defaultState = {
  currentUser: null,
  signedIn: false
};

const SessionReducer = (state = defaultState, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case SessionConstants.ADD_LIKE:
      newState.currentUser.liked_recipes.push(action.recipe);
      return newState;
    case SessionConstants.REMOVE_LIKE:
      let likesRecipeIds = newState.currentUser.liked_recipes.map(r=> r.id);
      let index = likesRecipeIds.indexOf(action.recipe.id);
      newState.currentUser.liked_recipes.splice(index, 1);
      return newState;
    case SessionConstants.RECEIVE_CURRENT_USER:
      return merge({}, state, {currentUser: action.user, signedIn: true});
    case SessionConstants.SIGN_OUT:
      return {currentUser: null, signedIn: false};
    default:
      return state;
  }
};

export default SessionReducer;
