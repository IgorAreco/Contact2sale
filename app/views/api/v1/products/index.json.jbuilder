json.array! @products do |product|
  json.extract! product, :title, :product_type, :rating, :price, :created_at
end
