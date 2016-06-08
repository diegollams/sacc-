class Appointment < ActiveRecord::Base
  #-- Includes
  extend Decorator
######################### Validations ##########################
    validates :customer_id, :date, :time, :place, presence: true
    enum status: { upcoming: "upcoming", canceled: "canceled", done: "done" }

    after_create :check_creation
    after_update :process_change

####################### Active Relations ########################
    belongs_to :customer
    has_one :user, through: :customer

#################### Class Methods / Scopes #####################
    scope :from_customer, ->(customer, status) {where( customer_id: customer.id, status: status).order(date: :asc, time: :asc)}
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

    def process_change
        if status_changed?
            case status
            when Appointment.statuses[:canceled] 
                observations = I18n.t 'appointments.appointment_was_canceled', date: I18n.l(date, format: :human_date), time: I18n.l(time, format: :human_time), place: place
            when Appointment.statuses[:upcoming] 
                observations = I18n.t 'appointments.appointment_was_renewed', date: I18n.l(date, format: :human_date), time: I18n.l(time, format: :human_time), place: place
            when Appointment.statuses[:done] 
                observations = I18n.t 'appointments.appointment_was_done', date: I18n.l(date, format: :human_date), time: I18n.l(time, format: :human_time), place: place
            end
            Interaction.create(kind: :quotation, date: Date.today, time: Time.now, customer: customer, observation: observations)
        end
    end

    def check_creation
        observations = I18n.t 'appointments.appointment_was_created', date: I18n.l(date, format: :human_date), time: I18n.l(time, format: :human_time), place: place
        Interaction.create(kind: :quotation, date: Date.today, time: Time.now, customer: customer, observation: observations)
    end

end
