json.extract! cart, :id, :user_id, :artwork_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
