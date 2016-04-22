class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :interactions

  enum marital_status: [ :single, :married ]
  enum gender: [ :male, :female ]


  def fullname
    [first_name, middle_name, last_name].join(" ")
  end
end
