class Quotation < ActiveRecord::Base
  belongs_to :customer
  validates :price,:square_meters,:customer_id, presence: true
  scope :from_customer , ->(customer_id) {where( customer_id: customer_id).order(created_at: :asc)}

end
