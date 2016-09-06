import { SearchConstants } from '../actions/search_actions.js';


const SearchReducer = (state=[], action) => {
  switch (action.type) {
    case SearchConstants.RECEIVE_SEARCH_AUTOCOMPLETE:
      return action.recipes;
    case SearchConstants.CLEAR_AUTO_COMPLETE:
      return [];
    default:
      return state;
  }
};

export default SearchReducer;
