
@categories.each do |category|
  formatted = { title: category.title, url: category.image.url }
  json.set! category.id, formatted
end


# suggestion will be added!
