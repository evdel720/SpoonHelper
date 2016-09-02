json.id @recipe.id
json.title @recipe.title
json.description @recipe.description
json.ingredients @recipe.ingredients
json.user @recipe.user
json.category_id @recipe.category.id
json.prep_time @recipe.prep_time
json.cook_time @recipe.cook_time

steps = @recipe.steps

steps = steps.sort_by { |s| s['order'] }

json.steps steps, :id, :body, :order
