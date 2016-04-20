json.array!(@customers) do |customer|
  json.extract! customer, :id, :register_date, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode, :user_id
  json.url customer_url(customer, format: :json)
end
