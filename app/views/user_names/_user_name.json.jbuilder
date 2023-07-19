json.extract! user_name, :id, :first_name, :last_name, :created_at, :updated_at
json.url user_name_url(user_name, format: :json)
