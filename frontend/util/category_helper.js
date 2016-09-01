const categoryIdTitleSelector = (categories) => (
  Object.keys(categories).map((cId) => [cId, categories[cId].title])
);

export { categoryIdTitleSelector };
