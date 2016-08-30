import { combineReducers } from 'redux';
import SessionReducer from './session_reducer.js';
import ErrorReducer from './error_reducer.js';

const RootReducer = combineReducers({
  session: SessionReducer,
  errors: ErrorReducer
});

export default RootReducer;
