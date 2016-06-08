class Offer < ActiveRecord::Base
  extend Decorator
  #-- Active Relations
  #-- Validations
  validates :name, :percentage, :expiration, presence: true
  #-- class methods / scopes
  scope :actives, ->(date) {where('expiration > ?',date)}
  #-- instance methods
  def to_s
    "#{name}, %#{percentage}"
  end
end
