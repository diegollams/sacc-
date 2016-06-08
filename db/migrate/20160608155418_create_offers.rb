class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.date :expiration
      t.decimal :percentage
      t.text :observations

      t.timestamps null: false
    end
  end
end
