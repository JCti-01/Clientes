json.extract! client, :id, :name, :birthdate, :phone, :description, :active, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
