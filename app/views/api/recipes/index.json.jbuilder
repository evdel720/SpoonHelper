json.category @category
json.sorted_by @sorted_by

items = {}

@recipes.each do |recipe|
  images = recipe.steps.select { |s| s['body'].start_with?('1') }
  data = { id: recipe.id, title: recipe.title, user: recipe.user.email, rep_image: images.last['body'] }
  items[recipe.id] = data
end

json.items items
