class Customer < ActiveRecord::Base

  ######################### Validations ##########################
  validates :first_name,:middle_name,:gender,:salesman_id,presence: true

  ####################### Active Relations ########################
  belongs_to :salesman, :class_name => "User", :foreign_key => "salesman_id"
  has_many :interactions
  has_many :appointments
  has_many :quotations
  enum marital_status: [ :single, :married ]
  enum gender: [ :male, :female ]

  delegate :name, to: :salesman, prefix: true, allow_nil: true
  #################### Class Methods / Scopes #####################
  scope :search , ->(search){
      if search.blank?
        all
      else
        includes(:appointments,:interactions).where('(customers.first_name || \' \' || customers.middle_name || \' \' || customers.last_name) ILIKE ? ', "%#{search}%")
      end
  }
  ####################### Instance Methods ########################
  def to_builder
    Jbuilder.new do |customer|
      customer.register_date created_at.strftime(I18n.t('date.formats.human_date'))
      customer.(self, :id, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode, :salesman_id,:main_phone,:secondary_phone)
    end
  end

  def fullname
    [first_name, middle_name, last_name].join(" ")
  end

  def appointments_of(date = nil)
    date.nil? ? appointments : appointments.where(date: date);
  end

end
