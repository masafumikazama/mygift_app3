json.extract! gift, :id, :title, :target_price, :description, :registry_id, :created_at, :updated_at
json.url gift_url(gift, format: :json)
