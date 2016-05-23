class Lot < ActiveRecord::Base
  # belongs_to :salesman, class_name: "User", foreign_key: "salesman_id"
  #-- Instance Methods
  def to_s
    "Block: #{block},Stage: #{stage}"
  end
end
