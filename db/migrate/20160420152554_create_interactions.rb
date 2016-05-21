class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :kind
      t.text :observation, default: ''
      t.date :date
      t.time :time
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
