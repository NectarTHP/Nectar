Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users
  resources :charges

  resources :artworks do
    resources :images, only:[:create]
  end
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :comments
  resources :favorites
  resources :line_items
  resources :carts
  resources :likes
  resources :orders
# routes for static_pages :

get "/contacts", to: "static_pages#contact_us", :as => 'contact'
get "/about_us", to: "static_pages#about_us", :as => 'about'
get "/legal_information", to: "static_pages#legal_information", :as => 'legal_information'


end

