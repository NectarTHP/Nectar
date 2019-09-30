json.extract! artwork, :id, :user_id, :name, :description, :price, :picture_url, :categorie, :weight, :width, :height, :sale, :tag, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
