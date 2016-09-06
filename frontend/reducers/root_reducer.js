import { combineReducers } from 'redux';
import SessionReducer from './session_reducer.js';
import ErrorReducer from './error_reducer.js';
import CategoryReducer from './category_reducer.js';
import RecipeRecuder from './recipe_reducer.js';
import SearchReducer from './search_reducer.js';


const RootReducer = combineReducers({
  session: SessionReducer,
  errors: ErrorReducer,
  categories: CategoryReducer,
  recipes: RecipeRecuder,
  search: SearchReducer
});

export default RootReducer;
