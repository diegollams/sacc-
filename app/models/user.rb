class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ######################### Validations ##########################
  validates :name, :email, presence: true

  ####################### Active Relations ########################

  has_many :customers, class_name: 'Customer', foreign_key: 'salesman_id'
  has_many :interactions, through: :customers
  has_many :appointments
  royce_roles %w[ admin staff salesman ] # roles names were arbitrary selected, consensus required

  devise :database_authenticatable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable
  #################### Class Methods / Scopes #####################
  def is_my_customer?(customer)
    admin? or customer.id == id
  end

end
