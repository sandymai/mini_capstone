Rails.application.routes.draw do
  namespace :api do
    # get "/products_list" => "products#products_available"
    # get "/products_list/:item" => "products#products_available"
    # get "/one_products_list/" => "products#one_product_available" 
    # post "/body_url" => "products#one_product_available"
    # # # # 
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end