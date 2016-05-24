class Lot < ActiveRecord::Base
  #-- Includes
  extend Decorator
  # belongs_to :salesman, class_name: "User", foreign_key: "salesman_id"
  #-- Instance Methods
  def to_s
    "Block: #{block},Stage: #{stage}"
  end
end
