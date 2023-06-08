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

  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  get 'about', to: 'static_pages#about'  

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

namespace :admin do
  root to: 'dashboard#index'
end

namespace :admin do
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/new_product', to: 'dashboard#new_product'
  post 'dashboard/create_product', to: 'dashboard#create_product'
end

end
