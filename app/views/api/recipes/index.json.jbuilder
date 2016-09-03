json.category @category
json.sorted_by @sorted_by

items = {}

@recipes.each do |recipe|
  images = recipe.steps.select { |s| s['body'].start_with?('1') }
  rep_img = images.empty? ? @default_image : images.last['body']
  data = { id: recipe.id, total_cooking: recipe.prep_time + recipe.cook_time, title: recipe.title, user: recipe.user.email, rep_image: rep_img }
  items[recipe.id] = data
end

json.items items
