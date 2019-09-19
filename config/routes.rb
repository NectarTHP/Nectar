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
  resources :line_items
  resources :carts
  resources :likes
  resources :orders

  # routes for static_pages :

  get "/contact_us", to: "static_pages#contact_us", :as => 'contact'
  get "/about_us", to: "static_pages#about_us", :as => 'about'
  get "/faq", to: "static_pages#faq", :as => 'faq'
end
