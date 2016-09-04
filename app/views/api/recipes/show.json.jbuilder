json.id @recipe.id
json.title @recipe.title
json.description @recipe.description
json.ingredients @recipe.ingredients
json.user @recipe.user, :id, :username
json.category @recipe.category, :id, :title
json.prep_time @recipe.prep_time
json.cook_time @recipe.cook_time

steps = @recipe.steps

steps = steps.sort_by { |s| s['order'] }

json.steps steps, :id, :body, :order
