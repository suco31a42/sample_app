json.extract! user, :id, :name, :age, :height, :weight, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
