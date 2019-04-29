json.extract! dater, :id, :name, :username, :password, :phone_number, :gender, :age, :created_at, :updated_at
json.url dater_url(dater, format: :json)
