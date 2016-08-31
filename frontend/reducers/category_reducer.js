import { CategoryConstants } from '../actions/category_actions.js';

const CategoryReducer = (state={}, action) => {
  switch (action.type) {
    case CategoryConstants.RECEIVE_CATEGORIES:
      return action.categories;
    default:
      return state;
  }
};

export default CategoryReducer;
