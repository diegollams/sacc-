class Quotation < ActiveRecord::Base
  #-- Validations
  validates :unit_price,:square_meters,:customer_id, :counteroffer, presence: true
  validate :validate_counteroffer
  #-- Active Relations
  belongs_to :customer
  belongs_to :lot
  has_one :salesman, through: :customer
  #-- Class Variables
  VALID_AFTER = 15
  attr_reader :full_price
  #-- Class Methods / Scopes
  default_scope {order('created_at DESC')}
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(created_at: :asc)}
  scope :from_month, ->(date) {where(created_at: date.beginning_of_month..date.end_of_month)}
  after_create :generate_interaction
  #-- Instance Methods
  def  validate_counteroffer
    if counteroffer > 100 or counteroffer < 0
      # make i18 string
      errors.add(:counteroffer,'must be beetwen 0 and 100')
    end
  end

  def generate_interaction
    observations = "-Precio terreno: #{full_price} -Precio con descuento: #{counteroffer_price} -Metros: #{square_meters} -Precio por metro: #{unit_price}"
    Interaction.create(kind: :quotation,date: Date.today,time: Time.now, customer: customer,observation: observations)
  end

  def full_price
    unit_price * square_meters
  end

  def counteroffer_price
    (full_price * (100 -counteroffer)) / 100
  end

  def valid_until
   created_at.to_date + VALID_AFTER.days
  end

  def still_valid?(date)
    date <= valid_until
  end
end
