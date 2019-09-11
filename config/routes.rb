Rails.application.routes.draw do

  resources :artworks
  root 'home#index'
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  
  resources :users
  resources :likes
  resources :comments
  resources :favorites
  resources :transactions
  resources :carts
  
end
