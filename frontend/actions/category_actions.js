const CategoryConstants = {
  REQUEST_CATEGORIES: "REQUEST_CATEGORIES",
  RECEIVE_CATEGORIES: "RECEIVE_CATEGORIES"
};

const requestCategories = () => ({
  type: CategoryConstants.REQUEST_CATEGORIES
});

const receiveCategories = (categories) => ({
  type: CategoryConstants.RECEIVE_CATEGORIES,
  categories
});

export { CategoryConstants, requestCategories, receiveCategories };
