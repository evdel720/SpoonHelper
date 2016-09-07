@default_image = '1http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png'

@categories.each do |category|
  recipe = category.recipes.sample
  if recipe.rep_img == @default_image
    recipe = category.recipes.select { |r| r.rep_img != @default_image }.sample
  end
  suggestion = { id: recipe.id, rep_img: recipe.rep_img, title: recipe.title }
  formatted = { title: category.title, url: category.image.url, suggestion: suggestion }
  json.set! category.id, formatted
end
