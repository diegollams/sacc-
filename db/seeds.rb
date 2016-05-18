user = User.create name: 'The Bit Corps', email: 'dev@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.admin!
user = User.create name: 'The Vendor Corps', email: 'v@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.salesman!
Customer.create first_name: 'Omar', middle_name: 'de Yesus', last_name: 'Vasquez', marital_status: 'married',gender: 'male', salesman: User.first
