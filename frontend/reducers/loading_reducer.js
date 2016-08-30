import { LoadingConstants } from '../actions/loading_actions.js';

const LoadingReducer = (state = false, action) => {
  switch (action.type) {
    case LoadingConstants.TOGGLE_LOADING_STATUS:
      return !state;
    default:
      return state;
  }
};

export default LoadingReducer;
