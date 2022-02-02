json.array! @products do |product|
  json.extract! product, :title, :type, :rating, :price, :created_at
end
