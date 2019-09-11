Rails.application.routes.draw do

  resources :likes
  root 'home#index'
  devise_for :users

  resources :artworks
  resources :users
  resources :comments
  resources :favorites
  resources :transactions
  resources :carts
  
end
