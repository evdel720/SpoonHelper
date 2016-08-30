import { SessionConstants, receiveCurrentUser, receiveErrors } from '../actions/session_actions.js';
import merge from 'lodash/merge';

const defaultState = {
  currentUser: null,
  signedIn: false
};

const SessionReducer = (state = defaultState, action) => {
  switch (action.type) {
    case SessionConstants.RECEIVE_CURRENT_USER:
      return merge({}, state, {currentUser: action.user, signedIn: true});
    case SessionConstants.RECEIVE_ERRORS:
      return merge({}, state, {errors: action.errors});
    case SessionConstants.SIGN_OUT:
      return {currentUser: null, errors: {}};
    default:
      return state;
  }
};

export default SessionReducer;
