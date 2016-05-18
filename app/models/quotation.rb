class Quotation < ActiveRecord::Base
  ######################### Validations ##########################
  validates :unit_price,:square_meters,:customer_id, presence: true
  ####################### Active Relations ########################
  belongs_to :customer
  belongs_to :lot
  has_one :salesman,through: :customer
  #################### Class Variables #####################
  VALID_AFTER = 15
  attr_reader :full_price
  #################### Class Methods / Scopes #####################
  default_scope {order('created_at DESC')}
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(created_at: :asc)}
  scope :from_month, ->(date) {where(created_at: date.beginning_of_month..date.end_of_month)}

  ####################### Instance Methods ########################
  def full_price
    unit_price * square_meters
  end

  def valid_until
   created_at + VALID_AFTER.days
  end

  def still_valid?(date)
    date <= valid_until
  end

end
