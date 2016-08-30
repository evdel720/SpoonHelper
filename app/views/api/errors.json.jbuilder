@errors.keys.each do |key|
  errors = @errors[key].map { |m| [key.capitalize, m].join(' ') }
  json.set! key, errors
end
