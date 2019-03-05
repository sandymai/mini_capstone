class Api::ProductsController < ApplicationController
  # def products_available
  #   @input_item = params["item"] || ("no item found")
  #   if @input_item[0] == "d"
  #     @input_item = Product.first
  #   elsif @input_item[0] == "c"
  #     @input_item = Product.second
  #   elsif @input_item[0] == "p"
  #     @input_item = Product.third
  #   end
  #   render "products_available.json.jbuilder"
  # end

  # def one_products_available
  #   product_id = params["id"]
  #   @product = Product.find_by(id: product_id)
  #   render "one_products_available.json.jbuilder"
  # end

  def index
    @product = Product.all
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url]
      )
    @product.save
    render "show.json.jbuilder"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id]) 
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: {message: "Product has been removed."}
  end
end