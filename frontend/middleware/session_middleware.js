import { SessionConstants, receiveCurrentUser } from '../actions/session_actions.js';
import { receiveErrors, clearErrors } from '../actions/error_actions.js';
import * as Util from '../util/session_api_util.js';

const SessionMiddleware = (store) => (next) => (action) => {
  const signUpandInSuccess = (userOb) => {
    window.currentUser = userOb;
    store.dispatch(clearErrors());
    store.dispatch(receiveCurrentUser(userOb.user));
  };
  const errorCallback = (errors) => {
    store.dispatch(receiveErrors(errors.responseJSON));
  };
  switch (action.type) {
    case SessionConstants.SIGN_IN:
      Util.signIn(action.user, signUpandInSuccess, errorCallback);
      break;
    case SessionConstants.SIGN_UP:
      Util.signUp(action.user, signUpandInSuccess, errorCallback);
      break;
    case SessionConstants.SIGN_OUT:
      window.currentUser = undefined;
      Util.signOut(() => {
        store.dispatch(clearErrors());
        next(action);
      });
      break;
    default:
      return next(action);
  }
};

export default SessionMiddleware;
