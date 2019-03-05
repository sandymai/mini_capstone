json.array! @product.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.image_url product.image_url
  json.is_discounted product.is_discounted?
  json.sales_tax product.sales_tax
  json.pet_total product.total
end