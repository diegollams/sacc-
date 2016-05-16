json.array!(@quotations) do |quotation|
  json.extract! quotation, :id, :customer_id, :square_meters, :unit_price, :full_price
  json.url quotation_url(quotation, format: :json)
end
