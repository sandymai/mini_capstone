class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "Carted")
    render "index.json.jbuilder"
  end

  def create
    product = Product.find_by(id: params[:product_id])

    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted"
      # order_id: 
      )
    if @carted_product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity 
    end
  end

  def destroy
    carted_products = current_user.carted_products.where(status: "Carted", 
    id: params[:id])
    carted_products.update_all(
    status: "Removed"
    )
    render json: {message: "Order has been marked as removed."}
  end
end