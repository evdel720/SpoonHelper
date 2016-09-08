liked_recipes = []
user.liked_recipes.each do |r|
  liked_recipes << { id: r.id, rep_img: r.image.url }
end

recipes = []
user.recipes.each do |r|
  recipes << { id: r.id, rep_img: r.image.url }
end

user_data = { id: user.id, username: user.username, liked_recipes: liked_recipes, recipes: recipes }

json.user user_data
