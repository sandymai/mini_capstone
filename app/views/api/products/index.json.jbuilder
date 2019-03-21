json.array! @products.each do |product|
  json.partial! "product.json.jbuilder", purple_product: product
end