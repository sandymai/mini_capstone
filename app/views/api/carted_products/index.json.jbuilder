json.array! @carted_products.each do |purple_product|
  json.partial! "carted_product.json.jbuilder", purple_product: purple_product
end