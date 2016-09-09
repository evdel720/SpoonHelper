json.category @category

items = {}

@recipes.each do |recipe|
  data = { id: recipe.id, likes: recipe.like.length, total_cooking: recipe.prep_time + recipe.cook_time, title: recipe.title, user: recipe.user.username, rep_img: recipe.image.url }
  items[recipe.id] = data
end

json.items items
