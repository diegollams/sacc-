class Appointment < ActiveRecord::Base
  belongs_to :customer
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(date: :asc,time: :asc)}
  validates :customer_id,:date,:time,:place,presence: true
end
