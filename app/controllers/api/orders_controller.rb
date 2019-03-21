class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    # @orders = Order.all
    render "index.json.jbuilder"
  end


  def create

    product = Product.find_by(id: params[:product_id]) #this is talking to the product database

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    if current_user
      @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
      @order.save

      carted_products = current_user.carted_products.where(status: "Carted")
      carted_products.update_all(
        order_id: @order.id,
        status: "Purchased"
      )
      render "show.json.jbuilder"
      # render json: {message: "Thank you for your order!"}
    else
      render json: {message: "Unable to process order"}
    end
  end


  def destroy
    @order = Order.find_by(id: params["id"])
    @order.destroy
    render json: {message: "Order has been removed."}
  end

end