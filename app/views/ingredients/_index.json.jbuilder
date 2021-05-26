json.array! @myingredients do |ingredient|
  json.set! "text", ingredient.name.capitalize
  json.set! "id", ingredient.id
end
  