class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ######################### Validations ##########################
  validates :name, :email, presence: true

  ####################### Active Relations ########################

  has_many :customers, class_name: 'Customer', foreign_key: 'salesman_id',dependent: :nullify
  has_many :interactions, through: :customers
  has_many :appointments, through: :customers
  royce_roles %w[ admin staff salesman ] # roles names were arbitrary selected, consensus required

  devise :database_authenticatable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable
  #################### Class Methods / Scopes #####################

  def self.most_proactive
    sm = User.includes(:interactions).salesmen.sort{ |x, y| x.interactions.count <=> y.interactions.count}
    sm.first
  end

  ####################### Instance Methods ########################
  def is_my_customer?(customer)
    # admin can control of all customers
    admin? or customer.id == id
  end

  def appointments_of(date)
    appointments.where(date: date)
  end
end
