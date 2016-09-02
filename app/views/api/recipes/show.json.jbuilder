json.id @recipe.id
json.title @recipe.title
json.description @recipe.description
json.ingredients @recipe.ingredients
json.user @recipe.user
json.steps @recipe.steps, :id, :body, :order
json.category_id @recipe.category.id
