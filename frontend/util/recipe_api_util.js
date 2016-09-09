export const fetchAutoComplete = (data, success) => {
  $.ajax({
    url: '/api/recipes/search.json',
    type: 'GET',
    data: data,
    success
  });
};

export const fetchSearchRecipes = (data, success) => {
  $.ajax({
    url: '/api/recipes.json',
    type: 'GET',
    data: data,
    success
  });
};

export const fetchCategoryRecipes = (cId, success, error) => {
  $.ajax({
    url: '/api/recipes.json',
    type: "GET",
    data: {category_id: cId},
    success,
    error
  });
};

export const fetchSingleRecipe = (rId, success, error) => {
  $.ajax({
    url: `/api/recipes/${rId}.json`,
    type: "GET",
    success,
    error
  });
};

export const createRecipe = (recipe, success, error) => {
  $.ajax({
    url: `/api/recipes.json`,
    type: "POST",
    data: recipe,
    success,
    error
  });
};

export const updateRecipe = (rId, data, success, error) => {
  $.ajax({
    url: `/api/recipes/${rId}.json`,
    type: "PATCH",
    data: {recipe: data},
    success,
    error
  });
};

export const deleteRecipe = (rId, success) => {
  $.ajax({
    url: `/api/recipes/${rId}.json`,
    type: "DELETE",
    success
  });
};

export const deleteStep = (sId) => {
  $.ajax({
    url: `/api/steps/${sId}.json`,
    type: "DELETE"
  });
};
