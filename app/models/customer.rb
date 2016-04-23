class Customer < ActiveRecord::Base
  belongs_to :salesman, :class_name => "User", :foreign_key => "salesman_id"
  has_many :interactions

  enum marital_status: [ :single, :married ]
  enum gender: [ :male, :female ]


  def fullname
    [first_name, middle_name, last_name].join(" ")
  end
end
