class Api::ProductsController < ApplicationController
  def products_available
    @dog = Product.all
    @cat = Product.all
    @parrot = Product.all
    render "products_available.json.jbuilder"
  end
end