
@categories.each do |category|
  recipe = category.recipes.sample
  suggestion = { id: recipe.id, rep_img: recipe.rep_img, title: recipe.title }
  formatted = { title: category.title, url: category.image.url, suggestion: suggestion }
  json.set! category.id, formatted
end
