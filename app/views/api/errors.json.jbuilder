@errors.keys.each do |key|
  errors = @errors[key].map { |m| [key.to_s.gsub('_id', '').gsub('_', ' ').capitalize, m].join(' ') }
  json.set! key, errors
end
