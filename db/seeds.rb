user = User.create name: 'The Bit Corps', email: 'dev@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.admin!
user = User.create name: 'The Vendor Corps', email: 'v@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.salesman!

c = Customer.create first_name: 'Omar', middle_name: 'de Yesus', last_name: 'Vasquez', marital_status: 'married',gender: 'male', salesman: User.first

Interaction.create(kind: 'Phone',date: Date.today,time: Time.now,customer: c)

Quotation.create(square_meters: 1000,unit_price: 1000,customer: c)
