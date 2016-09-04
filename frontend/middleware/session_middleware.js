import { SessionConstants, receiveCurrentUser } from '../actions/session_actions.js';
import { receiveErrors, clearErrors } from '../actions/error_actions.js';
import * as SessionUtil from '../util/session_api_util.js';
import { hashHistory } from 'react-router';

const SessionMiddleware = (store) => (next) => (action) => {
  const signUpandInSuccess = (userOb) => {
    window.currentUser = userOb;
    store.dispatch(receiveCurrentUser(userOb.user));
  };
  const errorCallback = (errors) => {
    store.dispatch(receiveErrors(errors.responseJSON));
  };
  switch (action.type) {
    case SessionConstants.GUEST_SIGN_IN:
      SessionUtil.guestSignIn(signUpandInSuccess);
      break;
    case SessionConstants.SIGN_IN:
      SessionUtil.signIn(action.user, signUpandInSuccess, errorCallback);
      break;
    case SessionConstants.SIGN_UP:
      SessionUtil.signUp(action.user, signUpandInSuccess, errorCallback);
      break;
    case SessionConstants.SIGN_OUT:
      window.currentUser = undefined;
      SessionUtil.signOut(() => {
        store.dispatch(clearErrors());
        hashHistory.push('/');
        next(action);
      });
      break;
    default:
      return next(action);
  }
};

export default SessionMiddleware;
