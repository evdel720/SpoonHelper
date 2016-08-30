import { combineReducers } from 'redux';
import SessionReducer from './session_reducer.js';
import ErrorReducer from './error_reducer.js';
import LoadingReducer from './loading_reducer.js';


const RootReducer = combineReducers({
  session: SessionReducer,
  errors: ErrorReducer,
  loading: LoadingReducer
});

export default RootReducer;
