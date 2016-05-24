class Appointment < ActiveRecord::Base
  #-- Includes
  extend Decorator
######################### Validations ##########################
    validates :customer_id, :date, :time, :place, presence: true
    enum status: { upcoming: "upcoming", canceled: "canceled", done: "done" }

####################### Active Relations ########################
    belongs_to :customer
    has_one :user, through: :customer

#################### Class Methods / Scopes #####################
    scope :from_customer, ->(customer) {where( customer_id: customer.id).order(date: :asc, time: :asc)}
    scope :same_date, ->(date) {where(date: date)}
    scope :after_date, ->(date) {where('date > ?', date)}
    scope :before_date, ->(date) {where('date < ?', date)}
    scope :from_month, ->(date) {where(date: date.beginning_of_month..date.end_of_month)}

####################### Instance Methods ########################

    def start_time
        date
    end

    def passed?
        date <= Date.today && time.seconds_since_midnight <= Time.now.seconds_since_midnight
    end

end
