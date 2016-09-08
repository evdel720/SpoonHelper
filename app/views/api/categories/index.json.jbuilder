@default_image = '1http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png'

@categories.each do |category|
  recipe = category.recipes.first
  suggestion = { id: recipe.id, rep_img: recipe.image.url, title: recipe.title }
  formatted = { title: category.title, url: category.image.url, suggestion: suggestion }
  json.set! category.id, formatted
end
