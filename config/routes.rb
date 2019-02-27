Rails.application.routes.draw do
  namespace :api do
    get "/products_list" => "products#products_available"
  end
end