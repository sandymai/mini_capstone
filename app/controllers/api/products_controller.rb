class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    name_search = params[:search]
    if name_search 
      @products = @products.where("name ILIKE ?", "%#{name_search}%")
    end 

    if params["discount"]
      @products = @products.where("price < ?", 100)
    end

    price_sort = params[:sort]
    another_sort = params[:sort_order]
    if price_sort == "price" && another_sort == "desc"
      @products = @products.order(:price => :desc)
    elsif price_sort == "price"
      @products = @products.order(:price => :asc)
    else
      products = @products.order(:id => :asc)
    end 

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: 1
    )
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity    
    end
  end

  def show
    if current_user
      @product = Product.find_by(id: params[:id])
      render "show.json.jbuilder"
    else
      render json: {message: "Unauthorized User"}
    end
  end

  def update
    @product = Product.find_by(id: params[:id]) 
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: {message: "Product has been removed."}
  end
end