import { SearchConstants, receiveSearchAutocomplete } from '../actions/search_actions.js';
import { fetchAutoComplete } from '../util/recipe_api_util.js';

const SearchMiddleware = (store) => (next) => (action) => {
  const fetchSuccess = (recipes) => {
    store.dispatch(receiveSearchAutocomplete(recipes));
  };
  switch (action.type) {
    case SearchConstants.REQUEST_SEARCH_AUTOCOMPLETE:
      fetchAutoComplete(action.data, fetchSuccess);
      break;
    default:
      return next(action);
  }
};

export default SearchMiddleware;
