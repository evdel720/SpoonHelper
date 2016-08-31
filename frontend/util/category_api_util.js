const fetchCategories = (success) => {
  $.ajax({
    url: '/api/categories.json',
    type: 'GET',
    success
  });
};

export { fetchCategories };
