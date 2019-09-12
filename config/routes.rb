Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  resources :charges

  resources :artworks
  resources :users
  resources :comments
  resources :favorites
  resources :transactions
  resources :carts
  resources :likes
  
end
