Rails.application.routes.draw do

  root 'home#index'
  devise_for :users

  resources :artworks
  resources :users
  resources :likes
  resources :comments
  resources :favorites
  resources :transactions
  resources :carts
  
end
