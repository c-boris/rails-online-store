Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "devise/sessions#new"

  # devise_scope :user do
  #   get "devise/sessions#new" => "sessions_controller"
  #   end
end
