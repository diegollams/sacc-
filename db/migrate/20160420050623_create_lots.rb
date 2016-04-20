class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :number
      t.string :block
      t.string :stage
      t.decimal :area
      t.string :status
      t.integer :salesman_id
      t.string :perimeter_points
      t.string :perimeter_lengths
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
