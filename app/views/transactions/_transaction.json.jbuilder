json.extract! transaction, :id, :user_id, :artwork_id, :item_qty, :order_number, :tracking_number, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
