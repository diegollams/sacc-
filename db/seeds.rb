user = User.create name: 'The Bit Corps', email: 'dev@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.admin!
user = User.create name: 'The Vendor Corps', email: 'v@thebitcorps.com', password: '12345678', password_confirmation: '12345678'
user.salesman!

l1 = Lot.create(number: 1, block: 1, stage: 'caca', area: 'caca', status: 'available', active: true)
Lot.create(number: 2, block: 2, stage: 'blah', area: 'blah', status: 'sold', active: true)
c = Customer.create first_name: 'Omar', middle_name: 'de Yesus', last_name: 'Vasquez', marital_status: 'married',gender: 'male', salesman: User.first
Quotation.create(square_meters: 1000, unit_price: 1000, customer: c, lot: l1)
