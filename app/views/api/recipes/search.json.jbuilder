recipes = []

@recipes.each do |recipe|
  recipes << { id: recipe.id, title: recipe.title, rep_img: recipe.image.url }
end

json.array! recipes
