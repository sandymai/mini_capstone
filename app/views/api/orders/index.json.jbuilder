json.array! @orders.each do |order|
  json.id order.id
  json.user_id order.user_id
  json.quantity order.quantity
  json.product_id order.product_id
  json.subtotal order.subtotal
  json.tax order.tax
  json.total order.total
end