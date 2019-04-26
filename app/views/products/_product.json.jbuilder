json.extract! product, :id, :name, :details, :price, :stock, :image_path, :created_at, :updated_at
json.url product_url(product, format: :json)
