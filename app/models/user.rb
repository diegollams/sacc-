class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,:email,presence: true

  has_many :interactions,through: :customers
  royce_roles %w[ admin staff salesman ]
  # has_many :lots, :class_name => "Lot", :foreign_key => "salesman_id"
end
