json.extract! image, :id, :name, :tags, :url, :created_at, :updated_at
json.url image_url(image, format: :json)
