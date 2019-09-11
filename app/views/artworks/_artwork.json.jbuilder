json.extract! artwork, :id, :user_id, :name, :description, :price, :picture_url, :categorie, :weight, :size, :sale, :tag, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
