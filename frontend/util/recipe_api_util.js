const fetchAllRecipes = (success) => {
  $.ajax({
    url: '/api/recipes',
    type: "GET",
    success,
    error: (resp) => {console.log(resp);}
  });
};

const fetchCategoryRecipes = (cId, success) => {
  $.ajax({
    url: '/api/recipes.json',
    type: "GET",
    data: {category_id: cId},
    success,
    error: (resp) => {console.log(resp);}
  });
};

const fetchSingleRecipe = (rId, success) => {
  $.ajax({
    url: `/api/recipes${rId}.json`,
    type: "GET",
    success,
    error: (resp) => {console.log(resp);}
  });
};

const 
