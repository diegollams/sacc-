json.extract! @customer, :id, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode, :salesman_id,:main_phone,:secondary_phone
  json.register_date @customer.register_date.strftime '%B %d, %Y'
