class Customer < ActiveRecord::Base
  belongs_to :salesman, :class_name => "User", :foreign_key => "salesman_id"
  has_many :interactions
  has_many :appointments
  enum marital_status: [ :single, :married ]
  enum gender: [ :male, :female ]

  validates :first_name,:middle_name,:gender,presence: true

  delegate :name, to: :salesman, prefix: true, allow_nil: true

  def fullname
    [first_name, middle_name, last_name].join(" ")
  end

  def self.search(search)
    if search.blank?
      all
    else
      includes(:appointments,:interactions).where('(customers.first_name || \' \' || customers.middle_name || \' \' || customers.last_name) ILIKE ? ', "%#{search}%")
    end
  end
end
