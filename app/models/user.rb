class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable
  royce_roles %w[ admin staff salesman ] # roles names were arbitrary selected, consensus required

  validates :name, :email, presence: true

  has_many :customers, class_name: 'Customer', foreign_key: 'salesman_id'
  has_many :interactions, through: :customers
  has_many :appointments,through: :customers
end
