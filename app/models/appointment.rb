class Appointment < ActiveRecord::Base
######################### Validations ##########################
    validates :customer_id, :date, :time, :place, presence: true

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

    def time_distance
        date_time = (date.to_s + " " + time.to_s).to_time
        distance = date_time - Time.now
        if distance > 0
            t 'appointments.from_now', time: ActionView::Helpers::DateHelper::distance_of_time_in_words_to_now(date_time)
        else
        end
    end

end
