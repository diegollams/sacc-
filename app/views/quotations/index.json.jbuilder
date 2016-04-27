json.array!(@quotations) do |quotation|
  json.extract! quotation, :id, :customer_id, :square_meters, :price
  json.url quotation_url(quotation, format: :json)
end
