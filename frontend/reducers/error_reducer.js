import { ErrorConstants } from '../actions/error_actions.js';
import merge from 'lodash/merge';

const ErrorReducer = (state = {}, action) => {
  switch (action.type) {
    case ErrorConstants.RECEIVE_ERRORS:
      return action.errors;
    case ErrorConstants.CLEAR_ERRORS:
      return {};
    default:
      return state;
  }
};

export default ErrorReducer;
