class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :lot, index: true, foreign_key: true
      t.decimal :square_meters
      t.decimal :unit_price
      t.decimal :counteroffer, default: 0.0

      t.timestamps null: false
    end
  end
end
