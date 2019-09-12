Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  resources :charges

  resources :artworks
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :comments
  resources :favorites
  resources :transactions
  resources :carts
  resources :likes
  
end
