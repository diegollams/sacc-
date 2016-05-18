class Interaction < ActiveRecord::Base
  belongs_to :customer
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(date: :asc,time: :asc)}
  validates :kind,:date,:time,:customer_id,presence: true

  default_scope {order('created_at ASC')}
end
