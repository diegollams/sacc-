user = User.create name: 'The Bit Corps', email: 'dev@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.admin!
user = User.create name: 'The Vendor Corps', email: 'v@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.salesman!
c = Customer.create register_date: Time.now, first_name: 'Omar', middle_name: 'de Yesus', last_name: 'Vasquez', marital_status: 'married',gender: 'male', salesman: User.first
Quotation.create(square_meters: 1000,unit_price: 1000,customer: c)