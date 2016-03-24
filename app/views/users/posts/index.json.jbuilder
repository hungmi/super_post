json.array!(@posts) do |post|
  json.extract! post, :id, :address, :price, :description, :post_type, :user_id, :status
  json.url post_url(post, format: :json)
end
