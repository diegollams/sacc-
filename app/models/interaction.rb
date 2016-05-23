class Interaction < ActiveRecord::Base
  #-- Active Relations
  belongs_to :customer

  #-- Validations
  validates :kind,:date,:time,:customer_id,presence: true

  #-- Class Methods / Scopes
  default_scope {order('created_at DESC')}

  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(date: :asc,time: :asc)}
  scope :from_month, -> (date) {where(date: date.beginning_of_month..date.end_of_month)}

  def observation_list
    observation.try(:split, ('-'))
  end
end
