class Quotation < ActiveRecord::Base
  #-- Includes
  extend Decorator
  #-- Validations
  validates :unit_price, :square_meters, :customer_id, presence: true

  #-- Active Relations
  belongs_to :offer
  belongs_to :customer
  belongs_to :lot
  has_one :salesman, through: :customer
  #-- Class Variables
  VALID_AFTER = 15
  attr_reader :full_price
  #-- Class Methods / Scopes
  default_scope {order('created_at DESC')}
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(created_at: :asc)}
  scope :from_month, ->( date) {where(created_at: date.beginning_of_month..date.end_of_month)}
  after_create :generate_interaction


  def generate_interaction
    # should I include number_to_currency helper to generate de message? atte llamas
    observations = I18n.t 'quotations.interaction_observation', full_price: full_price, counteroffer_price: counteroffer_price, square_meters: square_meters, unit_price: unit_price
    Interaction.create(kind: :quotation, date: Date.today, time: Time.now, customer: customer, observation: observations)
  end

  def full_price
    unit_price * square_meters
  end

  def counteroffer_price
    counteroffer = try(:offer).try(:percentage) || 0
    (full_price * (100 - counteroffer)) / 100
  end

  def valid_until
   created_at.to_date + VALID_AFTER.days
  end

  def still_valid?(date)
    date <= valid_until
  end
end
