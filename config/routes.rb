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

   # error pages
   %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
end

