json.extract! favorite, :id, :user_id, :artwork_id, :created_at, :updated_at
json.url favorite_url(favorite, format: :json)
