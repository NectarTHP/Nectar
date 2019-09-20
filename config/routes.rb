Rails.application.routes.draw do
  
  get 'static_pages/about_us'
  get 'static_pages/contact_us'
  get 'static_pages/legal_information'
  root 'home#index'
  devise_for :users
  resources :charges

  resources :artworks
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :comments
  resources :favorites
  resources :line_items
  resources :carts
  resources :likes
  resources :orders


end

