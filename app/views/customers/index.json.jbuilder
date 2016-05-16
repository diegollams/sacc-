json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode, :user_id
  json.register_date @customer.register_date.strftime('%B %d, %Y')
  json.url customer_url(customer, format: :json)
end
