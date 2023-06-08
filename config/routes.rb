Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :items
  resources :carts
  resources :cart_items, only: [:create, :destroy, :update]
  resources :orders
  resources :orderitems
  root to: "items#index"

  resources :profiles, only: [:show, :edit, :update]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end
