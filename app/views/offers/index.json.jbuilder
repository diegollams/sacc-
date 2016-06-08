json.array!(@offers) do |offer|
  json.extract! offer, :id, :name, :expiration, :percentage, :observations
  json.url offer_url(offer, format: :json)
end
