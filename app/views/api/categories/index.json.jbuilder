
@categories.each do |category|
  json.set! category.id, category, :title, :image_url
end


# suggestion will be added!
