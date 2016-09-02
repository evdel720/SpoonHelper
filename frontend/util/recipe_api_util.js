export const fetchAllRecipes = (success) => {
  $.ajax({
    url: '/api/recipes',
    type: "GET",
    success,
    error: (resp) => {console.log(resp);}
  });
};

export const fetchCategoryRecipes = (cId, success) => {
  $.ajax({
    url: '/api/recipes.json',
    type: "GET",
    data: {category_id: cId},
    success,
    error: (resp) => {console.log(resp);}
  });
};

export const fetchSingleRecipe = (rId, success) => {
  $.ajax({
    url: `/api/recipes/${rId}.json`,
    type: "GET",
    success,
    error: (resp) => {console.log(resp);}
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

export const updateRecipe = (data, success, error) => {
  $.ajax({
    url: `/api/recipes/${data.recipe.id}.json`,
    type: "PATCH",
    data: data,
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
