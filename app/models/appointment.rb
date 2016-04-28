class Appointment < ActiveRecord::Base
  belongs_to :customer
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(date: :asc,time: :asc)}
  scope :same_date  , ->(date) { where(date: date)}
  scope :after_date ,->(date){where('date > ?',date)}
  scope :before_date ,->(date){where('date < ?',date)}
  validates :customer_id,:date,:time,:place,presence: true
end
