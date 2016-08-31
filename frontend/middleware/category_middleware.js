import { CategoryConstants, receiveCategories } from '../actions/category_actions.js';
import { fetchCategories } from '../util/category_api_util.js';

const CategoryMiddleware = (store) => (next) => (action) => {
  const fetchSuccess = (categories) => {
    store.dispatch(receiveCategories(categories));
  };
  switch (action.type) {
    case CategoryConstants.REQUEST_CATEGORIES:
      fetchCategories(fetchSuccess);
      break;
    default:
      return next(action);
  }
};

export default CategoryMiddleware;
