json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :sum, :date_time, :wallet_id, :purchase_id
  json.url transaction_url(transaction, format: :json)
end
