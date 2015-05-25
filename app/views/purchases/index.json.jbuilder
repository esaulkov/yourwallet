json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :name, :category_id
  json.url purchase_url(purchase, format: :json)
end
