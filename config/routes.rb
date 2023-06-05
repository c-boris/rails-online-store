Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :items
  resources :carts
  resources :orders
  resources :orderitems
  root to: "items#index"
end
