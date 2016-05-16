class Customer < ActiveRecord::Base

  ######################### Validations ##########################
  validates :first_name,:middle_name,:gender,:salesman_id,presence: true

  ####################### Active Relations ########################
  belongs_to :salesman, :class_name => "User", :foreign_key => "salesman_id"
  has_many :interactions
  has_many :appointments
  enum marital_status: [ :single, :married ]
  enum gender: [ :male, :female ]

  delegate :name, to: :salesman, prefix: true, allow_nil: true
  #################### Class Methods / Scopes #####################
  def self.search(search)
    if search.blank?
      all
    else
      includes(:appointments,:interactions).where('(customers.first_name || \' \' || customers.middle_name || \' \' || customers.last_name) ILIKE ? ', "%#{search}%")
    end
  end
  ####################### Instance Methods ########################
  def fullname
    [first_name, middle_name, last_name].join(" ")
  end

end
