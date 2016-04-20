class Customer < ActiveRecord::Base
  belongs_to :user

  enum marital_status: [ :single, :married]
  enum gender: [ :male, :female]
end
