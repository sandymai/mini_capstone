Rails.application.routes.draw do

  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"


  namespace :api do
    post "/carted_products" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
    get "/carted_products/:id" => "carted_products#show"
    delete "/carted_products/:id" => "carted_products#destroy"


    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/orders/:id" => "oreders#show"
    delete "/orders/:id" => "orders#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end