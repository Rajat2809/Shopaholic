json.extract! purchase, :id, :total_price, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
