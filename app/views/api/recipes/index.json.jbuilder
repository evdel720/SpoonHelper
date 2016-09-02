json.category @category
json.sorted_by = @sorted_by

items = {}

@recipes.each do |recipe|
  data = { title: recipe.title, user: recipe.user.email }
  items[recipe.id] = data
end

json.items items
