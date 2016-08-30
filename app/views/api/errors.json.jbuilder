@errors.keys.each do |key|
  value = [key.capitalize, @errors[key][0]].join(' ')
  json.set! key, value
end
